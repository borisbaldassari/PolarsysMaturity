
        <div id="page-wrapper">
          <div class="row">
            <div class="col-lg-12">
              <h2>Project gendoc</h2>

              <div class="tabbable">
                <ul class="nav nav-pills" role="tablist">
                  <li role="presentation" class="active"><a href="#home" role="tab" data-toggle="tab">PMI</a></li>
                  <li role="presentation"><a href="#qm" role="tab" data-toggle="tab">QM</a></li>
                  <li role="presentation"><a href="#attrs" role="tab" data-toggle="tab">Attributes</a></li>
                  <li role="presentation"><a href="#questions" role="tab" data-toggle="tab">Metrics</a></li>
                  <li role="presentation"><a href="#metrics" role="tab" data-toggle="tab">Metrics</a></li>
                  <li role="presentation"><a href="#practices" role="tab" data-toggle="tab">Practices</a></li>
                  <li role="presentation"><a href="#actions" role="tab" data-toggle="tab">Actions</a></li>
                  <li role="presentation"><a href="#log" role="tab" data-toggle="tab">Errors</a></li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content">
                  <div role="tabpanel" class="tab-pane active" id="home"><br />
                    <dl class="dl-horizontal">
                      <dt>Description</dt>
                      <dd><p>Gendoc extracts data from EMF models and generates documents that fully respect the appearance of your document template.</p>
<p>The generation can be performed in a few steps:</p>
<table><tbody><tr><td>
				<img src="http://www.eclipse.org/proposals/modeling.gendoc/1.png" /></td>
<td>
				Get or write a standard template document in OpenOffice Writer (.odt) or Microsoft Word (.docx) format,</td>
</tr><tr><td>
				<img src="http://www.eclipse.org/proposals/modeling.gendoc/2.png" /></td>
<td>
				Add script sections to get dynamic content from models : each dynamic section of the template contains a script written in M2T Acceleo language,</td>
</tr><tr><td>
				<img src="http://www.eclipse.org/proposals/modeling.gendoc/3.png" /></td>
<td>
				Reference the model as datasource,</td>
</tr><tr><td>
				<img src="http://www.eclipse.org/proposals/modeling.gendoc/4.png" /></td>
<td>
				Launch the generation directly from the template</td>
</tr><tr><td>
				<img src="http://www.eclipse.org/proposals/modeling.gendoc/5.png" /></td>
<td>
				The generation result fully respects the template document, with all dynamic sections filled with model content</td>
</tr></tbody></table><p><img src="http://www.eclipse.org/proposals/modeling.gendoc/gendoc_generation_details.png" style="height: 360px; width: 481px;" /></p>
<p>Styles defined in the template are kept after generation, both on static and dynamic parts.</p>
<p>Gendoc is currently used in several contexts (avionics, space, public services) to produce various kinds of documentation:</p>
<ul><li>
		Specification or design document from UML or SysML models</li>
<li>
		Requirement document from Req-IF models</li>
<li>
		Test plan from a model containing Test scenarii</li>
<li>
		Interface configuration document</li>
<li>
		Data structure description from specific EMF models</li>
</ul></dd>
                      <dt>Web</dt>
                      <dd><a href="undefined">undefined</a></dd>
                      <dt>Wiki</dt>
                      <dd><a href="undefined">undefined</a></dd>
                      <dt>Downloads</dt>
                      <dd><a href="undefined">undefined</a></dd>
                      <dt>Documentation</dt>
                      <dd><a href="undefined">undefined</a></dd>
                      <dt>Getting Started</dt>
                      <dd><a href="undefined">undefined</a></dd>
                    </dl>
                  </div>
                  <div role="tabpanel" class="tab-pane" id="qm">...</div>
                  <div role="tabpanel" class="tab-pane" id="attrs">
                  </div>
                  <div role="tabpanel" class="tab-pane" id="metrics"><table class="table table-striped table-condensed table-hover">
<tr><th width="50%">Name</th><th width="30%">Mnemo</th><th width="20%">Value</th></tr>
<tr><td><a href="/documentation/metrics.html#ITS_AUTH_1M">ITS authors</a></td><td><a href="/documentation/metrics.html#ITS_AUTH_1M">ITS_AUTH_1M</a></td><td>0</td></tr>
<tr><td><a href="/documentation/metrics.html#ITS_BUGS_DENSITY">Defect density</a></td><td><a href="/documentation/metrics.html#ITS_BUGS_DENSITY">ITS_BUGS_DENSITY</a></td><td>500</td></tr>
<tr><td><a href="/documentation/metrics.html#ITS_FIX_MED_1M">Median time to fix bug</a></td><td><a href="/documentation/metrics.html#ITS_FIX_MED_1M">ITS_FIX_MED_1M</a></td><td>0</td></tr>
<tr><td><a href="/documentation/metrics.html#ITS_UPDATES_1M">ITS updates</a></td><td><a href="/documentation/metrics.html#ITS_UPDATES_1M">ITS_UPDATES_1M</a></td><td>1</td></tr>
<tr><td><a href="/documentation/metrics.html#SCM_COMMITS_1M">SCM Commits</a></td><td><a href="/documentation/metrics.html#SCM_COMMITS_1M">SCM_COMMITS_1M</a></td><td>0</td></tr>
<tr><td><a href="/documentation/metrics.html#SCM_COMMITTED_FILES_1M">Files committed</a></td><td><a href="/documentation/metrics.html#SCM_COMMITTED_FILES_1M">SCM_COMMITTED_FILES_1M</a></td><td>0</td></tr>
<tr><td><a href="/documentation/metrics.html#SCM_COMMITTERS_1M">SCM committers</a></td><td><a href="/documentation/metrics.html#SCM_COMMITTERS_1M">SCM_COMMITTERS_1M</a></td><td>0</td></tr>
</table>
</div>
                  <div role="tabpanel" class="tab-pane" id="practices"></div>
                  <div role="tabpanel" class="tab-pane" id="actions">...</div>
                  <div role="tabpanel" class="tab-pane" id="log">
                    <ul class="list-group">
                      <li class="list-group-item"><span class="label label-danger">ERROR</span>  Cannot find attributes file [../../samples//gendoc/gendoc_attributes.json] for [gendoc].</li>
                      <li class="list-group-item"><span class="label label-danger">ERROR</span>  Cannot find violations file [../../samples//gendoc/gendoc_violations.json] for [gendoc].</li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
