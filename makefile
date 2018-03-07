
file_path=./section
temporary_path=./temp
setting_path=./setting
bib_path=./bib
file_name=demo
source_file=$(file_name).tex 
temporary_file=$(file_name).xdv
target_file=$(file_name).pdf

$(target_file) : $(source_file) $(file_path)/*.tex $(setting_path)/*.tex $(bib_path)/*.bib
	xelatex -no-pdf -halt-on-error -output-directory=$(temporary_path) $(source_file)
	bibtex $(temporary_path)/$(file_name)
	xelatex -no-pdf -halt-on-error -output-directory=$(temporary_path) $(source_file)
	xelatex -no-pdf -halt-on-error -output-directory=$(temporary_path) $(source_file)
	xdvipdfmx $(temporary_path)/$(temporary_file)
	open $(target_file)

clean :
	rm $(target_file) $(temporary_path)/*