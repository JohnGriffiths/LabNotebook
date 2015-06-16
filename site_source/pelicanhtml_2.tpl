{%- extends 'basic.tpl' -%}

{%- set cell_style = 'style_bw_python.tplx' -%}

{% block in_prompt -%}
{%- endblock in_prompt %}

{% block out_prompt -%}
{%- endblock out_prompt %}


{% block stream_stdout -%}
<div class="box-flex1 output_subarea output_stream output_stdout">
<pre class="ipynb">{{output.text |ansi2html}}</pre>
</div>
{%- endblock stream_stdout %}

{% block stream_stderr -%}
<div class="box-flex1 output_subarea output_stream output_stderr">
<pre class="ipynb">{{output.text |ansi2html}}</pre>
</div>
{%- endblock stream_stderr %}

{% block pyerr -%}
<div class="box-flex1 output_subarea output_pyerr">
<pre class="ipynb">{{super()}}</pre>
</div>
{%- endblock pyerr %}

{%- block data_text %}
<pre class="ipynb">{{output.text | ansi2html}}</pre>
{%- endblock -%}

{% block input %}
{% if "# <!-- collapse=True -->" in cell.input %}
<div class="collapseheader box-flex1"><span style="font-style: italic; background:transparent; font-size: .7em; "> (0_0) </span>
<div class="input_area box-flex1" style="display:none; background-color:transparent; ">
{{ cell.input.replace("# <!-- collapse=True -->\n", "") | highlight2html(metadata=cell.metadata) }}
</div>
</div>
{% elif "# <!-- collapse=False -->" in cell.input %}
<div class="collapseheader box-flex1"><span style="font-style: italic; font-size: .7em;  background:transparent;"> (-_-) </span>
<div class="input_area box-flex1" style="background:transparent">
{{ cell.input.replace("# <!-- collapse=False -->\n", "") | highlight2html(metadata=cell.metadata) }}
</div>
</div>
{% else %}
<div class="input_area box-flex1 white">
{{ cell.input | highlight2html(metadata=cell.metadata) }}
</div>
{% endif %}
{%- endblock input %}
