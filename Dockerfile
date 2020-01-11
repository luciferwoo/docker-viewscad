FROM fedora
RUN dnf -y install openscad python && \
    dnf clean all

COPY get-pip.py .
RUN python3 get-pip.py

COPY requirements.txt .
RUN pip install -r requirements.txt

EXPOSE 8888
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--allow-root"]