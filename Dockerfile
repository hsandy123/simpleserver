FROM quay.io/projectquay/golang:1.17

# Copy our source file into the container
COPY webserver.go /go/webserver.go

# Set the default environment variables
ENV HOME /go

# Set permissions to the /go folder (for OpenShift)
RUN chgrp -R 0 /go && chmod -R g+rwX /go

# OpenShift picks up this label and creates a service
#LABEL io.openshift.expose-services 1234/http

# OpenShift uses root group instead of root user
USER 1001

# Command to run when container starts up
CMD go run webserver.go

