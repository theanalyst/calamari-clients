{% import 'setvars' as vars with context %}

copyin_build_product:
  cmd.run:
    - name: cp {{vars.builddir}}/calamari-clients*tar.gz {{vars.builddir}}/clients
    - user: {{vars.username}}
