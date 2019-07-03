---

{% set repos = salt['pillar.get']('repositories', {}) %}
{% for name, repo in repos|dictsort %}
add_repo_{{name}}:
  pkgrepo.managed:
    - name: {{name}}
    - enabled: {{repo.enabled}}
    - baseurl: {{repo.baseurl}}
    - gpgautoimport: {{repo.gpgautoimport}}
    - gpgkey: {{repo.gpgkey}}
    - refresh: {{repo.refresh}}
{% endfor %}

