
        <div id="page-wrapper">
          <div class="row">
            <div class="col-lg-12">

              <h3>Scales &gt; Grimoire</h3>
            
              <p>This information is based on the list of projects analysed for the Eclipse Foundation dashboard: <a href="http://dashboard.eclipse.org">dashboard.eclipse.org</a>. This represents a lot of data:</p>
              <ul class="fa-ul">
                <li><a href="http://dashboard.eclipse.org/scm.html"><i class="fa fa-li fa-check-square-o"></i>471 Git repositories</a>,</li>
                <li><a href="http://dashboard.eclipse.org/mls.html"><i class="fa fa-li fa-check-square-o"></i>175 mailing lists</a>,</li>
                <li><a href="http://dashboard.eclipse.org/its.html"><i class="fa fa-li fa-check-square-o"></i>197 ticketing trackers</a>.</li>
              </ul>
            
              <p>In order to make those metrics relative according to the first version of the maturity model, the lines of code were retrieved with an ad-hoc script. Those were based on the 471 Git repositories already mentioned.
All metrics are made relative using thousands of lines of code (KSLOC).</p>

              <div class="alert alert-warning" role="alert">Note: All of the Git repositories with no activity during the last month have been removed in the calculation of thresholds. From the original set, only 152/172 projects contained activity.</div>

              <p>The initial set of thresholds for metrics in Grimoire is the following:</p>

              <ul class="list-group">
                <li class="list-group-item">
                  <a href="metrics.html#SCM_COMMITS_1M"><strong>Number of commits</strong></a> (SCM_COMMITS_1M)<br />
                  [0.025078279624, 0.0756446929809, 0.264255236791, 2.54688585321]
                </li>
                <li class="list-group-item">
                  <a href="metrics.html#SCM_COMMITTERS_1M"><strong>Number of committers</strong></a> (SCM_COMMITTERS_1M)<br />
                  [0.00869816603364, 0.0242054327998, 0.0757305045383, 1.47492625369]
                </li>
                <li class="list-group-item"> 
                  <a href="metrics.html#SCM_COMMITTED_FILES_1M"><strong>Number of committed files</strong></a> (SCM_COMMITTED_FILES_1M)<br />
                  [0.069052601156, 0.294543274794, 0.948385435841, 38.8978930308]
                </li>
                <li class="list-group-item"> 
                  <a href="metrics.html#SCM_STABILITY_1M"><strong>SCM Stability</strong></a> (SCM_STABILITY_1M)<br />
                  [1.0, 1.14285714286, 1.4430952381, 3.79487179487]
                </li>
              </ul>
            </div>
          </div>
        </div>
