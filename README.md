# Cat Prediction
## Description
This project is developed in Octave/Matlab and implements two Machine Learning algorithms that classify images with cats.

## How to use
Enter a specific method folder and then:
    
    [X, Y] = preprocess('dataset/', histogram_type, count_bins)
    w = learn(X,Y)
    percentage = evaluate('testset/', w, histogram_type, count_bins)

## Key concepts
- RGB/HSV histograms
- working with vectors/matrices
- Gradient Descent prediction
- Householder prediction
