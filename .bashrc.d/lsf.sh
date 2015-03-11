if type -p bsub > /dev/null
then
    alias bsub="bsub -u $USER@genome.wustl.edu"
fi
