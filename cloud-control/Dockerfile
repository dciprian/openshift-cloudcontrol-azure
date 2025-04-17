FROM ghcr.io/dodevops/cloudcontrol-azure:latest

# Switch to root for installation
USER root

# Declare version arguments and architecture detection
ARG OC_VERSION=4.18.7
ARG TKN_VERSION=0.40.0
ARG TARGETARCH

# Install OpenShift CLI (oc) with architecture detection
RUN if [ "$TARGETARCH" = "amd64" ]; then \
      OC_ARCH="linux"; \
    elif [ "$TARGETARCH" = "arm64" ]; then \
      OC_ARCH="linux-arm64"; \
    else \
      echo "Unsupported architecture"; exit 1; \
    fi && \
    curl -L https://mirror.openshift.com/pub/openshift-v4/clients/ocp/${OC_VERSION}/openshift-client-${OC_ARCH}.tar.gz \
    | tar -xz -C /usr/local/bin oc && \
    chmod +x /usr/local/bin/oc

# Install Tekton CLI (tkn) with architecture detection
RUN if [ "$TARGETARCH" = "amd64" ]; then \
      TKN_ARCH="x86_64"; \
    elif [ "$TARGETARCH" = "arm64" ]; then \
      TKN_ARCH="aarch64"; \
    else \
      echo "Unsupported architecture"; exit 1; \
    fi && \

    curl -L https://github.com/tektoncd/cli/releases/download/v${TKN_VERSION}/tkn_${TKN_VERSION}_Linux_${TKN_ARCH}.tar.gz \
    | tar -xz -C /usr/local/bin tkn \
    && chmod +x /usr/local/bin/tkn

# Switch back to original user
USER cloudcontrol

# Verify installations (optional)
RUN oc version --client && tkn version