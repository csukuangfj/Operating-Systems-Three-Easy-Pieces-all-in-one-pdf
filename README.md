

## Operating Systems: Three Easy Pieces

We recommend you buying the book from one of the following sites:

- https://www.amazon.com/exec/obidos/ASIN/198508659X/
- https://www.amazon.com/gp/product/B00TPZ17O4

This repository provides script to download the pdfs from
http://pages.cs.wisc.edu/~remzi/OSTEP/
and merge all the files into a big pdf.

### Usage

```sh
sudo apt-get install poppler-utils

git clone https://github.com/csukuangfj/Operating-Systems-Three-Easy-Pieces-all-in-one-pdf.git

cd Operating-Systems-Three-Easy-Pieces-all-in-one-pdf

./downloads-and-merge-all-into-one-pdf.sh
```

and it will generate `all-in-one.pdf`
in the current directory.
