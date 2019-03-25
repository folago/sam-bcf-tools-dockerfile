FROM folago/samtools


ENV BCFTOOLS_VERSION 1.9

WORKDIR /

RUN apk add --no-cache build-base zlib-dev bzip2-dev xz-dev ncurses-dev ca-certificates wget && \
wget -q https://github.com/samtools/bcftools/releases/download/${BCFTOOLS_VERSION}/bcftools-${BCFTOOLS_VERSION}.tar.bz2 && \
tar xjvf bcftools-${BCFTOOLS_VERSION}.tar.bz2 && \
cd /bcftools-${BCFTOOLS_VERSION}/ && make && \
mv /bcftools-${BCFTOOLS_VERSION}/bcftools /bin/ && \
rm -rf /bcftools* && \
apk del build-base zlib-dev ca-certificates wget

