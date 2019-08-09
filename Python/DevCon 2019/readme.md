# Histopathologic Cancer Detection
https://www.kaggle.com/c/histopathologic-cancer-detection

This project was presented at the 2019 Cerner Developers Conference by Harlen Hays and Morgan Fuller. We participated in the Kaggle Competition, Histopathologic Cancer Detection and shared our project with an audience of over 250 data scientists, analysts, and engineers within the Cerner community. The goal of the competition was to design and optimize an algorithim that could correctly predict if a histopathologic slide image contained metastatic cancer tissue. The participants were provided with over 250,000 images and their corrosponding cancer tissue label. We were asked to make predictions on 16,000 additional images. We created a convolutional neural network modeled after VGGNet using the Tensorflow and Keras python libraries. Our model was trained on an Nvidia GTX 1080 and took 63 minutes to train.

Results: 

Classification Report:

                          precision    recall  f1-score   support

    a_no_tumor_tissue        0.96      0.95      0.95      8000
    b_has_tumor_tissue       0.95      0.96      0.95      8000
             micro avg       0.95      0.95      0.95     16000
             macro avg       0.95      0.95      0.95     16000
          weighted avg       0.95      0.95      0.95     16000
      

ROC AUC Score: 0.989


References: 

Stanford CNN Overview - http://cs231n.github.io/convolutional-networks/ 

Kaggle Public Kernel Referenced - https://www.kaggle.com/vbookshelf/cnn-how-to-use-160-000-images-without-crashing    

Keras Documentation - https://keras.io/

Scikit-learn Confusion Matrix - http://scikit-learn.org/stable/auto_examples/

