# LabelMeFacade

Data modified: 11/3/2019
Date created: 03-Sep-2010

Authors: Bjoern Froehlich and Erik Rodner

This is the LabelMeFacade Image Dataset, which we created from LabelMe images for semantic segmentation research. Since this is a subset of LabelMe images, the images were originally collected by the authors of http://publications.csail.mit.edu/tmp/MIT-CSAIL-TR-2005-056.pdf . All images should only be used for non-commercial and research experiments. Please check with the authors of the LabelMe dataset, in case you are unsure about the respective copyrights and how they apply.

## Colors and subsets

The dataset contains 100 images for training and 845 images for testing (see train.txt and test.txt for details).
Labels are in the labels.txt file and encoded the following way:
    
    various 1
    building 2
    car 3
    door 4
    pavement 5
    road 6
    sky 7
    vegetation 8
    window 9

## Citation

If you use this database please cite one of the following papers:

    @INPROCEEDINGS{Froehlich-Rodner-Denzler-ICPR2010,
	    author = {Bj{\"o}rn Fr{\"o}hlich and Erik Rodner and Joachim Denzler},
    	title = {A Fast Approach for Pixelwise Labeling of Facade Images},
	    booktitle = {Proceedings of the International Conference on Pattern Recognition
    	(ICPR 2010)},
    	year = {2010},
    }

    @inproceedings{Brust15:ECP,
        author = {Clemens-Alexander Brust and Sven Sickert and Marcel Simon and Erik Rodner and Joachim Denzler},
        booktitle = {CVPR Workshop on Scene Understanding (CVPR-WS)},
        title = {Efficient Convolutional Patch Networks for Scene Understanding},
        year = {2015},
    }

