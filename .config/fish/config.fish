if status is-interactive
    # Commands to run in interactive sessions can go here
end
source (/nix/store/40jwgdhzddjrgd732536shgdsilfl601-starship-1.19.0/bin/starship init fish --print-full-init | psub)