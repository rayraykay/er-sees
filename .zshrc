# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# useful fcns
function total-threads() { ps -eo nlwp | tail -n +2 | awk '{ num_threads += $1 } END { print num_threads }'; }
function thread-scoreboard() {
	users | tr ' ' '\n' | sort | uniq | while read u; do
		num_threads=$(ps -o nlwp -u "$u" | tail -n +2 | awk '{ num_threads += $1 } END { print num_threads }')
		printf "%5d %15s\n" "$num_threads" "$u";
	done | sort -hr
};
function mythreads() { ps -o nlwp,pid,command -u $USER | sort -h | cut -c -200; }

alias tmux='TERM=xterm-256color tmux'
