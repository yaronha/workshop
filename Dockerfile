FROM mlrun/jupyter:0.5.4

RUN python -m pip install scikit-plot
COPY ./*.ipynb $HOME