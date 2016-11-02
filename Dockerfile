# Copyright (c) 2016 Kaito Udagawa
# Released under the MIT license
# https://opensource.org/licenses/MIT

FROM frolvlad/alpine-glibc
ENV PATH=/usr/local/texlive/2016/bin/x86_64-linux:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN apk --no-cache add perl wget xz && \
    wget -qO- http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz | tar xz -C /tmp && \
    printf 'selected_scheme scheme-basic\noption_doc 0\noption_src 0' > /tmp/texlive.profile && \
    /tmp/install-tl-*/install-tl -profile /tmp/texlive.profile && \
    tlmgr install collection-luatex ms pgf pgfplots standalone times txfonts xcolor && \
    rm -fr /tmp/install-tl-* /tmp/texlive.profile && \
    apk --no-cache del perl wget xz
RUN apk --no-cache add bash
