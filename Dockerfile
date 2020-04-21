FROM alpine:3.7
RUN apk add --no-cache curl tar ca-certificates
RUN curl -L https://github.com/guumaster/env-replacer/releases/download/v1.0.0/env-replacer_1.0.0_linux_64-bit.tar.gz \
    | tar -zx -C /tmp && \
    chmod +x /tmp/env-replacer

FROM alpine:3.7
COPY --from=0 /tmp/env-replacer /bin/env-replacer
ENTRYPOINT ["/bin/env-replacer"]
