TEX = pdflatex -shell-escape -interaction=nonstopmode -file-line-error
# PRE =  $(TEX) -ini -job-name="preamble" "&pdflatex preamble.tex\dump"
BIB = bibtex

#Source:  http://tex.stackexchange.com/questions/40738/how-to-properly-make-a-latex-project

NAME = resume
PDFVIEWER = evince
LATEX2PNG = convert -density 200
#LATEX2HTML = 

.PHONY: all view

all : $(NAME).pdf
	$(LATEX2PNG)  $(NAME).pdf $(NAME).jpg

clean :
	rm -f $(NAME).aux
	rm -f $(NAME).log
	rm -f $(NAME).out
	rm -f $(NAME).pdf
#	rm -f $(NAME)-*.png
#	rm -f $(NAME)-*.jpg


view : $(NAME).aux $(NAME).pdf
	$(PDFVIEWER)  $(NAME).pdf

$(NAME).pdf $(NAME).aux $(NAME).idx : $(NAME).tex $(NAME).sty 
	#$(TEX) $(NAME).tex | gvim -
	$(TEX) $(NAME).tex
	# This checks if a rerun is needed (for .aux file) and reruns
	while grep 'Rerun to get ' $(NAME).log ; do $(TEX) $< ; done

#$(NAME).html :  all

# $(NAME).bbl $(NAME).blg : $(NAME).bib $(NAME).aux
# 	$(BIB) $(NAME)


# $(NAME).bib : $(NAME).tex
# 	$(TEX) $(NAME).tex

