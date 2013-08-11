if [ -z "$PERL5LIB" ]; then
    PERL5LIB="$HOME/lib/perl5"
else
    PERL5LIB="$PERL5LIB:$HOME/lib/perl5"
fi
export PERL5LIB
