BEGIN {
  FS="{xxx}";
  RESET_COLOR="\033[0m";
  SUBJECT_COLOR="\033[38;5;39m";
  HASH_COLOR="\033[38;5;240m";
  TAG_COLOR="\033[48;5;117m";
  HEAD_COLOR="\033[48;5;201m";
  MASTER_COLOR="\033[38;5;5m";
  ORIGIN_MASTER_COLOR="\033[48;5;118;38;5;0m";
  ORIGIN_COLOR="\033[48;5;250;38;5;0m";
  LOCAL_BRANCH_COLOR="\033[35;5;250m";
  RELEASE_TAG_COLOR="\033[48;5;226;38;5;0m";
  COMMITTER_COLOR="\033[38;5;244m";
  SPECIAL_AUTHOR_COLOR="\033[38;5;51m";
  # TODO add placeholder
  SPECIAL_AUTHOR_NAME="Karsten Groll";
}

function starts_with(text, prefix) {
  return index(text, prefix) == 1
}

function decorate_and_print_hash() {
  printf("%s%s%s ", HASH_COLOR, hash, RESET_COLOR);
}

function decorate_and_print_refs() {
  split(refs, refs_arr, ", ");
  for (key in refs_arr) {
    decorate_and_print_ref(refs_arr[key]);
  }
}

function decorate_and_print_ref(ref) {
  sub(/^ +/, "", ref);

  if (starts_with(ref, "tag: ")) {
    tag = ref;
    sub(/^tag: /, "", tag);
    decorate_and_print_tag(tag);
  } else {
    decorate_and_print_branch(ref);
  }
}

function decorate_and_print_tag(tag) {
  color="";
  if (tag ~ /^[0-9]+\.[0-9]+\.[0-9]+$/) {
    color = RELEASE_TAG_COLOR;
  } else {
    color = TAG_COLOR;
  }
  printf("%s%s%s ", color, tag, RESET_COLOR);
}

function decorate_and_print_subject() {
  # TODO add Links for ISSUES etc
  printf("%s ", subject);
}

function is_tmux() {
  return length(ENVIRON["TMUX"]) > 0
}

function decorate_and_print_branch(ref) {
  color = LOCAL_BRANCH_COLOR;

  if (ref ~ /^HEAD/) {
    color = HEAD_COLOR;
    sub(/^HEAD -> /, "", ref);
  } else if (ref ~ /^origin\/master/) {
    color = ORIGIN_MASTER_COLOR;
    sub(/^origin\//, "", ref);
  } else if (ref ~ /^origin\//) {
    color = ORIGIN_COLOR;
    sub(/^origin\//, "", ref);
  } else if (ref ~ /^master$/) {
    color = MASTER_COLOR;
  }
  
  printf("%s%s%s ", color, ref, RESET_COLOR);
}

function decorate_committer_and_date() {
  if (date == "" && commiter == "") {
    return;
  }

  if (committer ~ SPECIAL_AUTHOR_NAME) {
    printf("%s<%s%s%s %s>%s ", COMMITTER_COLOR, SPECIAL_AUTHOR_COLOR, committer, COMMITTER_COLOR, date, RESET_COLOR);
  } else {
    printf("%s<.%s. %s>%s ", COMMITTER_COLOR, committer, date, RESET_COLOR);
  }
}

{
  tree=$1
  hash=$2
  refs=$3
  subject=$4
  date=$5
  committer=$6
  printf("%s", tree);
  decorate_and_print_hash();
  decorate_and_print_subject();
  decorate_committer_and_date();
  decorate_and_print_refs();
  printf("\r\n")
}
