{% import 'setvars' as vars with context %}
git_clone:
  git:
    - latest
    - user: {{vars.username}}
    - target: {{vars.builddir}}/clients
    - name: {{vars.gitpath}}/calamari-clients

