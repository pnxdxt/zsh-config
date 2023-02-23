alias books-ps="rsync -e ssh -zavh books/ macmini:/Users/admin/Documents/pnodet/books --delete --progress"
alias books-ps-dry="rsync -e ssh -zanvh books/ macmini:/Users/admin/Documents/pnodet/books --delete --progress"
alias books-pl="rsync -e ssh -zavh macmini:/Users/admin/Documents/pnodet/books/ books --delete --progress"
alias books-pl-dry="rsync -e ssh -zanvh macmini:/Users/admin/Documents/pnodet/books/ books --delete --progress"
