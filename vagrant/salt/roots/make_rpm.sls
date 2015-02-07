{% import 'setvars' as vars with context %}
build_calamari_clients:
  cmd.run:
    - name: make rpm
    - user: {{vars.username}}
    - cwd: {{vars.builddir}}/clients
    - require:
      - git: git_clone

copy_calamari_clients:
  cmd.run:
    - name: cp rpmbuild/RPMS/x86_64/calamari-clients*.rpm {{vars.pkgdefst}}
    - cwd: {{vars.builddir}}
    - require:
      - cmd: build_calamari_clients

