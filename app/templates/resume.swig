Kale J. Franz, PhD
==================

Email  |kale@franz.io
-------|--------------------
Twitter|@kalefranz
-------|--------------------
Github |github.com/kalefranz
-------|--------------------
Resume |kale.franz.io


  {{ ImpactStatement|formatMarkdown(2, 50) }}


Education
----------------------------------------------

{%- for x in Education %}
{{ x.institution|safe }}
{{ x.title|safe }} -- {{ x.year|safe }}
{%- for detail in x.details %}
  - {{ detail|safe|formatMarkdown(4, 63) }}{%- endfor %}
{% endfor %}

Experience
----------------------------------------------
{%- for x in Experience %}
{{ x.institution|safe }} >> {{ x.location|safe }}
{{ x.title|safe }} -- {{ x.year|safe }}
{%- for detail in x.details %}
  - {{ detail|safe|formatMarkdown(4, 79) }}{%- if loop.last and x.subdetails -%}{%- for subdetail in x.subdetails %}
    * {{ subdetail|safe|formatMarkdown(6, 79) }}{%- endfor %}{%- endif -%}{%- endfor %}
{% endfor %}

Non-Technical Strengths
----------------------------------------------
{%- for x in NonTechnicalSkills %}
* {{ x.area|safe }}
{%- endfor %}


Software Skills
----------------------------------------------
{%- for x in SoftwareSkills %}
{%- if x.specifics %}
* {{ x|formatSoftwareSkill(2, 79)|safe }}{%- else %}
* {{ x.area|safe }}{%- endif -%}
{% endfor %}


Hardware Specialization
----------------------------------------------
{%- for x in HardwareSkills %}
* {{ x.area|safe }}
{%- endfor %}


Awards
----------------------------------------------
{%- for x in Awards %}
{{ x.year|safe }}  {{ x.award|safe|formatMarkdown(6, 79) }}
{%- endfor %}


Activities & Volunteer Service
----------------------------------------------
{%- for x in Activities %}
{{ x.year|safe }}  {{ x.activity|safe|formatMarkdown(11, 79) }}
{%- endfor %}



