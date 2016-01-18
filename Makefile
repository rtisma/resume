TEX = pdflatex -shell-escape -interaction=nonstopmode -file-line-error
# PRE =  $(TEX) -ini -job-name="preamble" "&pdflatex preamble.tex\dump"
BIB = bibtex

#Source:  http://tex.stackexchange.com/questions/40738/how-to-properly-make-a-latex-project

NAME = resume
PDFVIEWER = evince
LATEX2PNG = convert -density 200

.PHONY: all view

all : $(NAME).pdf

clean :
	rm -f $(NAME).aux
	rm -f $(NAME).log
	rm -f $(NAME).out
	rm -f $(NAME).pdf
#	rm -f $(NAME)-*.png
#	rm -f $(NAME)-*.jpg


view :
	$(PDFVIEWER)  $(NAME).pdf

$(NAME).pdf : $(NAME).tex 
	$(TEX) $(NAME).tex
	$(LATEX2PNG)  $(NAME).pdf $(NAME).jpg


# $(NAME).bbl $(NAME).blg : $(NAME).bib $(NAME).aux
# 	$(BIB) $(NAME)

$(NAME).aux : $(NAME).tex
	$(TEX) $(NAME).tex

# $(NAME).bib : $(NAME).tex
# 	$(TEX) $(NAME).tex

