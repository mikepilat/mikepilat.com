---
layout: post
title: Adding a certificate authority to the Java runtime
---
If you have a Java project or a Java server application, and it needs to access
an external resource via HTTPS but the resource's SSL certificate is not signed
by a trusted CA (Certificate Authority), you might see an error like the
following:

    javax.net.ssl.SSLHandshakeException:
      sun.security.validator.ValidatorException: PKIX path building failed:
      sun.security.provider.certpath.SunCertPathBuilderException: unable to find
      valid certification path to requested target

To fix it, you can import the public CA certificate that signed the SSL
certificate into your JDK or JRE so that Java can verify the SSL certificate. I
ran into this while configuring the [JIRA
plugin](https://wiki.jenkins-ci.org/display/JENKINS/JIRA+Plugin) for Jenkins to
talk to an company-internal JIRA server signed by a company-internal CA.

    sudo keytool -import -trustcacerts -file MyCompanyCA.crt -alias CompanyCA
      -keystore  $JAVA_HOME/jre/lib/security/cacerts

You'll be asked for a keystore password. To save you a trip to Google, the
default password for the `cacerts` keystore is
`changeit`. As implied, you probably should.

When asked `Trust this certificate?` by `keytool`, answer `yes` and you'll be
good to go. In my case, I had to restart Jenkins to get it to pick up the new
CA.

