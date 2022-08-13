#!/usr/bin/env python3
import os
import sys
from datetime import datetime
from subprocess import run
from shutil import which
from pathlib import Path
from typing import Union, Iterable
from enum import IntEnum
from functools import partial
from configparser import ConfigParser


class Console:
    stdout = print
    stderr = partial(print, file=sys.stderr)


class ExitCode(IntEnum):
    SUCCESS = 0
    FAILURE = 1


TARGETS = ('minimi',)


def is_command_available(command: str) -> bool:
    """Check if borg backup is available within the path."""
    return bool(which(command))


def backup(repo: Union[Path, str], paths: Iterable[Union[Path, str]]) -> int:
    repo = Path(repo)
    paths = (Path(p) for p in paths)
    now = datetime.now()
    name = f'{now.strftime("%Y.%m.%d-%H:%M")}'
    result = run([
        'borg',
        'create',
        '--verbose',
        '--list',
        '--show-rc',
        '--exclude-caches',
        '--exclude', 'home/*/.cache/*',
        f'{repo}::{name}',
        *(f'{path}' for path in paths)
    ])
    return result.returncode


def compact(repo: Union[Path, str]) -> int:
    result = run([
        'borg',
        'compact',
        '--verbose',
        f'{repo}'
    ])
    return result.returncode


def _load_config():
    home = os.environ['HOME']
    config = Path(home) / '.backup-config'
    with open(config) as f:
        parser = ConfigParser()
        parser.read_file(f)
        repo = Path(parser['repo']['path']).joinpath(parser['repo']['name'])
        repo = f'{repo}'
        paths = (path for key, path in parser.items('paths'))
        return repo, paths


def main():
    if not is_command_available('borg'):
        Console.stderr(f"The [borg] command is not available")
        exit(ExitCode.FAILURE)
    repo, paths = _load_config()
    sys.exit(backup(repo, paths) | compact(repo))


if __name__ == '__main__':
    main()
