WORKSPACE="$1"
if [ -z "$WORKSPACE" ]; then
    GIT_DIR=$(git rev-parse --show-toplevel)
    if [ -z "$GIT_DIR" ]; then
        echo "ERROR: Make sure you are in a git repo!"
        return 1
    fi
    WORKSPACE="$GIT_DIR"

    if [ "$WORKSPACE" != "$PWD" ]; then
        ORIG_PWD="$PWD"
        cd "$WORKSPACE"
    fi
fi
export WORKSPACE

if [ ! -f "$WORKSPACE/lib/perl/Genome.pm" ]; then
    echo "ERROR: Make sure you are in or providing a Genome workspace!"
    return 1
fi

export GENOMECI_BASEDIR=/gsc/scripts/opt/genome
$GENOMECI_BASEDIR/bin/model-test-prep-multi '5.10'
source $GENOMECI_BASEDIR/bin/model-test-env.sh "$WORKSPACE"

echo "--- UR, Workflow, and Genome ---"
wtf UR
wtf Workflow
wtf Genome
echo -e "\n"

export UR_DBI_NO_COMMIT=1
unset GENOME_QUERY_POSTGRES

if [ -n "$ORIG_PWD" ]; then
    cd $ORIG_PWD
fi
