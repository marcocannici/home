# ls aliases
alias ls='ls --color=auto'
alias ll='ls -l'
alias lla='ls -alF'
alias lh='ls -sh'
alias la='ls -A'
alias l='ls -CF'

#alias dir='dir --color=auto'
#alias vdir='vdir --color=auto'

# Colourize grep output.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Colourize diff
command -v colordiff >/dev/null 2>&1 && { alias diff=colordiff; }

# Graphical vim
if type vimx >/dev/null 2>&1; then 
    alias vim='vimx'
fi

# Git fast-forward merge
alias gff='git merge --ff-only'

# hub command for better GitHub integration.
# [ $(which hub 2>/dev/null) ] && alias git=hub

# Force password authentication with SSH. Used to get around the situation
# where SSH freezes while trying to do public key authentication because
# DIRO has the NFS/Kerberos Setup From Hell.
# From http://unix.stackexchange.com/q/15138
alias sshpw='ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no'

# Force 256 colors tmux
alias tmux="TERM=xterm-256color tmux"

# alias python_no_tcmalloc=$HOME"/.miniconda/bin/python"
# python() {
#     if [[ -f /usr/local/lib/libtcmalloc.so.4 ]]; then
#         msg="WARNING:Using Google's malloc.\nCall python_no_tcmalloc "
#         msg=$msg"to use the default python instead.\n"
#         echo -e $msg
#         LD_PRELOAD=/usr/local/lib/libtcmalloc.so.4 $HOME/.miniconda/bin/python "$@"
#     elif [[ -f /usr/lib/libtcmalloc.so.4 ]]; then
#         msg="WARNING:Using Google's malloc.\nCall python_no_tcmalloc "
#         msg=$msg"to use the default python instead.\n"
#         echo -e $msg
#         LD_PRELOAD=/usr/lib/libtcmalloc.so.4 $HOME/.miniconda/bin/python "$@"
#     elif [[ -f $HOME/.local/lib/libtcmalloc.so.4 ]]; then
#         msg="WARNING:Using Google's malloc.\nCall python_no_tcmalloc "
#         msg=$msg"to use the default python instead.\n"
#         echo -e $msg
#         LD_PRELOAD=$HOME/.local/lib/libtcmalloc.so.4 $HOME/.miniconda/bin/python "$@"
#     else
#         $HOME/.miniconda/bin/python "$@"
#     fi
# }

alias squeue='squeue -o "%.6i %.1t %.6q %.7m %.12b %.3C %.3D %.18k %.11L %R"'

# Quick and dirty installation of packages with pip from GitHub.
ghpip() {
    if [ $# == 0 ]; then
        echo "usage: ghpip user/project [branch/refspec]"
        return 1
    fi
    if [ $# == 1 ]; then
        GITHUBPATH=$1
        BRANCH=master
    else
        GITHUBPATH=$1
        BRANCH=$2
    fi
    pip install --upgrade "git+git://github.com/$GITHUBPATH.git@$BRANCH"
}

# disk usage
disk_usage() {
    # TODO: apparently ncdu is better
    du -h $1 2> >(grep -v '^du: cannot \(access\|read\)' >&2) | grep '[0-9\.]\+G' | sort -rn
}

# who is using gpus
gpu_who() {
    for i in `nvidia-smi -q -d PIDS | grep ID | cut -d ":" -f2`; do ps -u -p "$i"; done
}

# rsync options
alias rsyncopt="rsync -a -X --partial -h --progress --bwlimit=20000 --copy-links "
alias rsyncopt_nolimit="rsync -a -X --partial -h --progress --copy-links "
cpdataset() {
    if [ "$#" -ne 4 ]; then
        echo "Usage: cpdataset <source_files> <dest_user> <dest_server> <dest_root_dir>"
    else
        tar czf - $1 | ssh $2@$3 "cd $4 && tar xvzf -"
    fi
    }
export -f cpdataset

# Manage the weird pkscreen routine for lisa lab
alias frascreen="pkscreen; sleep 5; screen -r; sleep 2"

# Quick set THEANO_FLAGS
CPU(){ export THEANO_FLAGS="$THEANO_FLAGS_INIT",device=cpu,floatX=float32; }
CPU0(){ export THEANO_FLAGS="$THEANO_FLAGS_INIT",device=cpu0,floatX=float32; }
CPU1(){ export THEANO_FLAGS="$THEANO_FLAGS_INIT",device=cpu1,floatX=float32; }
CPU2(){ export THEANO_FLAGS="$THEANO_FLAGS_INIT",device=cpu2,floatX=float32; }
GPU(){ export THEANO_FLAGS="$THEANO_FLAGS_INIT",device=gpu,floatX=float32,scan.allow_gc=False; }
GPU0FAST(){ export THEANO_FLAGS="$THEANO_FLAGS_INIT",device=gpu0,floatX=float32,scan.allow_gc=False; }
GPU1FAST(){ export THEANO_FLAGS="$THEANO_FLAGS_INIT",device=gpu1,floatX=float32,scan.allow_gc=False; }
GPU2FAST(){ export THEANO_FLAGS="$THEANO_FLAGS_INIT",device=gpu2,floatX=float32,scan.allow_gc=False; }
GPU3FAST(){ export THEANO_FLAGS="$THEANO_FLAGS_INIT",device=gpu3,floatX=float32,scan.allow_gc=False; }
GPU4FAST(){ export THEANO_FLAGS="$THEANO_FLAGS_INIT",device=gpu4,floatX=float32,scan.allow_gc=False; }
GPU5FAST(){ export THEANO_FLAGS="$THEANO_FLAGS_INIT",device=gpu5,floatX=float32,scan.allow_gc=False; }
GPU6FAST(){ export THEANO_FLAGS="$THEANO_FLAGS_INIT",device=gpu6,floatX=float32,scan.allow_gc=False; }
GPU7FAST(){ export THEANO_FLAGS="$THEANO_FLAGS_INIT",device=gpu7,floatX=float32,scan.allow_gc=False; }
GPU8FAST(){ export THEANO_FLAGS="$THEANO_FLAGS_INIT",device=gpu8,floatX=float32,scan.allow_gc=False; }
GPU0(){ export THEANO_FLAGS="$THEANO_FLAGS_INIT",device=gpu0,floatX=float32; }
GPU1(){ export THEANO_FLAGS="$THEANO_FLAGS_INIT",device=gpu1,floatX=float32; }
GPU2(){ export THEANO_FLAGS="$THEANO_FLAGS_INIT",device=gpu2,floatX=float32; }
GPU3(){ export THEANO_FLAGS="$THEANO_FLAGS_INIT",device=gpu3,floatX=float32; }
GPU4(){ export THEANO_FLAGS="$THEANO_FLAGS_INIT",device=gpu4,floatX=float32; }
GPU5(){ export THEANO_FLAGS="$THEANO_FLAGS_INIT",device=gpu5,floatX=float32; }
CUDA(){ export THEANO_FLAGS="$THEANO_FLAGS_INIT",device=cuda,floatX=float32; }
CUDA0(){ export THEANO_FLAGS="$THEANO_FLAGS_INIT",device=cuda0,floatX=float32; }
CUDA1(){ export THEANO_FLAGS="$THEANO_FLAGS_INIT",device=cuda1,floatX=float32; }
CUDA2(){ export THEANO_FLAGS="$THEANO_FLAGS_INIT",device=cuda2,floatX=float32; }
CUDA3(){ export THEANO_FLAGS="$THEANO_FLAGS_INIT",device=cuda3,floatX=float32; }
FC(){ export THEANO_FLAGS=compiler=fast_compile${THEANO_FLAGS:+,${THEANO_FLAGS}}; }
PROFILE(){ export CUDA_LAUNCH_BLOCKING=1;export THEANO_FLAGS="$THEANO_FLAGS_INIT",proﬁle_memory=True,profile=True,$THEANO_FLAGS; }
PL(){ export THEANO_FLAGS="$THEANO_FLAGS",dnn.conv.algo_bwd_filter=time_once,dnn.conv.algo_bwd_data=time_once,optimizer_excluding=local_softmax_dnn_grad; }
TF(){ echo $THEANO_FLAGS; }

CVD_CLR(){ export CUDA_VISIBLE_DEVICES=''; }
CVD0(){ export CUDA_VISIBLE_DEVICES=${CUDA_VISIBLE_DEVICES:+${CUDA_VISIBLE_DEVICES},}0; }
CVD1(){ export CUDA_VISIBLE_DEVICES=${CUDA_VISIBLE_DEVICES:+${CUDA_VISIBLE_DEVICES},}1; }
CVD2(){ export CUDA_VISIBLE_DEVICES=${CUDA_VISIBLE_DEVICES:+${CUDA_VISIBLE_DEVICES},}2; }
CVD3(){ export CUDA_VISIBLE_DEVICES=${CUDA_VISIBLE_DEVICES:+${CUDA_VISIBLE_DEVICES},}3; }
CVD4(){ export CUDA_VISIBLE_DEVICES=${CUDA_VISIBLE_DEVICES:+${CUDA_VISIBLE_DEVICES},}4; }
CVD5(){ export CUDA_VISIBLE_DEVICES=${CUDA_VISIBLE_DEVICES:+${CUDA_VISIBLE_DEVICES},}5; }
CVD6(){ export CUDA_VISIBLE_DEVICES=${CUDA_VISIBLE_DEVICES:+${CUDA_VISIBLE_DEVICES},}6; }
CVD7(){ export CUDA_VISIBLE_DEVICES=${CUDA_VISIBLE_DEVICES:+${CUDA_VISIBLE_DEVICES},}7; }

# Displays
D0(){ export DISPLAY=localhost:0.0; }
D10(){ export DISPLAY=localhost:10.0; }
D11(){ export DISPLAY=localhost:11.0; }
D12(){ export DISPLAY=localhost:12.0; }

# conda: we don't want to mess with system-wide conda
upconda() {
    $HOME/.miniconda/bin/conda update conda
}

# ENVIRONMENTS
# =============
MARIA() {
    export VIRTUAL_ENV="$HOME/.miniconda/envs/mariana"
    export PATH="$HOME/.miniconda/bin:$PATH"
    export PYTHONPATH="$HOME/exp/mariana/code:$PYTHONPATH"
    source activate mariana
}
TF() {
    export VIRTUAL_ENV="$HOME/.miniconda/envs/tf"
    export PATH="$HOME/.miniconda/bin:$PATH"
    export PYTHONPATH="$HOME/exp/mariana/code:$PYTHONPATH"
    source activate tf
}
TH() {
    echo "Resetting THEANO_FLAGS, PYTHONPATH and PATH ..."
    CLR
    export PATH=$PATH:"/data/lisa/exp/visin/theano/theano/bin"
    # export PYTHONPATH=$PYTHONPATH:"/data/lisa/exp/visin/theano/theano/"
}
CLR() {
    if [ ! -z $CONDA_DEFAULT_ENV ]; then
        source ~/.miniconda/bin/deactivate 
    fi
    export THEANO_FLAGS="$THEANO_FLAGS_INIT"
    export PYTHONPATH="$PYTHONPATH_INIT"
    export PATH="$PATH_INIT"
    unset VIRTUAL_ENV
}

export -f MARIA
export -f CLR
export -f TF
export -f TH
