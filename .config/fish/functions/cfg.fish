function cfg --wraps='git --git-dir=$HOME/.cfg/ --work-tree=$HOME' --description 'alias cfg=git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
  git --git-dir=$HOME/.cfg/ --work-tree=$HOME $argv
        
end
