# Copyright (c) 2021 Oracle and/or its affiliates.
FROM alpine/git:v2.30.2

COPY script.sh /script.sh
RUN chmod +x /script.sh

ENTRYPOINT ["/script.sh"]