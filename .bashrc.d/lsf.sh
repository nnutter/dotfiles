if [ -x $(which bsub) ]; then
    alias bsub="bsub -u $USER@genome.wustl.edu"
fi
