export VAULT_ADDR=https://vault.agro.services

alias prox='export HTTP_PROXY="http://10.30.17.214:3128" && export HTTPS_PROXY="http://10.30.17.214:3128"'
alias unprox='unset HTTP_PROXY && unset HTTPS_PROXY'

alias use_nonprod='gcloud config set project cgs-nonprod && kubectl config use-context gke_cgs-nonprod_us-central1-a_cgs'
alias use_prod='gcloud config set project cgs-prod && kubectl config use-context gke_cgs-prod_us-central1-a_cgs-prod'
alias use_nonprod360='gcloud config set project product360-nonprod && kubectl config use-context gke_product360-nonprod_us-central1-a_product360'
alias use_prod360='gcloud config set project product360-prod && kubectl config use-context gke_product360-prod_us-central1-a_product360'

use '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc'
use '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc'

HOMEBREW_GITHUB_TOKEN=$(yq -r '."github.platforms.engineering"[0].oauth_token' ~/.config/hub)
export HOMEBREW_GITHUB_TOKEN
