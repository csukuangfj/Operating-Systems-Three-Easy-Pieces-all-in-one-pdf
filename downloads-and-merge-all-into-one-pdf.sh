#!/bin/bash

set -e

files=(
preface
toc
dialogue-threeeasy #1
intro # 2
dialogue-virtualization # 3
cpu-intro # 4
cpu-api # 5
cpu-mechanisms # 6
cpu-sched # 7
cpu-sched-mlfq # 8
cpu-sched-lottery # 9
cpu-sched-multi # 10
cpu-dialogue # 11

dialogue-vm # 12
vm-intro # 13
vm-api # 14
vm-mechanism # 15
vm-segmentation # 16
vm-freespace # 17
vm-paging # 18
vm-tlbs # 19
vm-smalltables # 20
vm-beyondphys # 21
vm-beyondphys-policy # 22
vm-complete # 23
vm-dialogue # 24

dialogue-concurrency # 25
threads-intro # 26
threads-api # 27
threads-locks # 28
threads-locks-usage # 29
threads-cv # 30
threads-sema # 31
threads-bugs # 32
threads-events # 33
threads-dialogue # 34

dialogue-persistence # 35
file-devices # 36
file-disks # 37
file-raid # 38
file-intro # 39
file-implementation # 40
file-ffs # 41
file-journaling # 42
file-lfs # 43
file-ssd # 44
file-integrity # 45
file-dialogue # 46
dialogue-distribution # 47
dist-intro # 48
dist-nfs # 49
dist-afs # 50
dist-dialogue # 51

dialogue-vmm
vmm-intro
dialogue-monitors
threads-monitors
dialogue-labs
lab-tutorial
lab-projects-systems
lab-projects-xv6
)

function downloads() {
  dir=books
  i=0
  mkdir -p $dir
  url=http://pages.cs.wisc.edu/~remzi/OSTEP
  for f in ${files[@]}; do
    i=$((i+1))
    name=$dir/$i-${f}.pdf
    if [ ! -f $name ]; then
      wget -O $name "$url/${f}.pdf" &
    fi
  done
  wait
}

function merge-pdfs() {
  if ! which pdfunite >/dev/null; then
    echo "pdfunite is not found."
    echo "please run sudo apt-get install poppler-utils"
    exit
  fi

  pushd books
  pdfs=$(ls -1 | sort -k 1 -t "-" -n)
  echo $pdfs
  pdfunite $pdfs all-in-one.pdf
  mv all-in-one.pdf ../
  popd

}

function main() {
  downloads
  merge-pdfs
}

main
