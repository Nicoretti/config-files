if status is-interactive
    # Commands to run in interactive sessions can go here
end
source (starship init fish --print-full-init | psub)

# Use bat as man pager if available
if command -v bat >/dev/null 2>&1; then
  set -x PAGER "bat --plain"
  set -x MANPAGER "bat --plain --language man"
fi
