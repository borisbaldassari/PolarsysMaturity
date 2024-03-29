

              <h3>Scales &gt; Grimoire</h3>
            
              <p>This information is based on the list of projects analysed for the Eclipse Foundation dashboard: <a href="http://dashboard.eclipse.org">dashboard.eclipse.org</a>. This represents a lot of data:</p>
              <ul class="fa-ul">
                <li><a href="http://dashboard.eclipse.org/scm.html"><i class="fa fa-li fa-check-square-o"></i>471 Git repositories</a>,</li>
                <li><a href="http://dashboard.eclipse.org/mls.html"><i class="fa fa-li fa-check-square-o"></i>175 mailing lists</a>,</li>
                <li><a href="http://dashboard.eclipse.org/its.html"><i class="fa fa-li fa-check-square-o"></i>197 ticketing trackers</a>.</li>
              </ul>
              
              <hr />
              
              <h4>Thresholds</h4>

              <p>The initial set of thresholds for SCM metrics in Grimoire is the following.</p>

              <ul class="list-group">
                <li class="list-group-item">
                  <a href="metrics.html#SCM_COMMITS_1M"><strong>Number of commits</strong></a> (SCM_COMMITS_1M)<br />
                  <p><span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 2 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 5 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 13 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 121 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
                </li>
                <li class="list-group-item">
                  <a href="metrics.html#SCM_COMMITTERS_1M"><strong>Number of committers</strong></a> (SCM_COMMITTERS_1M)<br />
                  <p><span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 1 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 2 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 3 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 18 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
                </li>
                <li class="list-group-item"> 
                  <a href="metrics.html#SCM_COMMITTED_FILES_1M"><strong>Number of committed files</strong></a> (SCM_COMMITTED_FILES_1M)<br />
                  <p><span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 3 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 19 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 95.75 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 2189 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
                </li>
                <li class="list-group-item"> 
                  <a href="metrics.html#SCM_STABILITY_1M"><strong>SCM Stability</strong></a> (SCM_STABILITY_1M)<br />
                  <p><span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &gt; 3.79487179487 &ge; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &gt; 1.4430952381 &ge; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &gt; 1.14285714286 &ge; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &gt; 1 &ge; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
                </li>
              </ul>

              <p>The initial set of thresholds for ITS metrics in Grimoire is the following.</p>

              <ul class="list-group">
                <li class="list-group-item">
                  <a href="metrics.html#ITS_AUTH_1M"><strong>ITS authors</strong></a> (ITS_AUTH_1M)<br />
                  <p><span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 2 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 4 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 9.75 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 80 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
                </li>
                <li class="list-group-item">
                  <a href="metrics.html#ITS_BUGS_DENSITY"><strong>Defect density</strong></a> (ITS_BUGS_DENSITY)<br />
                  <p><span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &gt; 3.36826347305 &ge; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &gt; 0.0755602867593 &ge; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &gt; 0.0335380213652 &ge; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &gt; 0.009367219332 &ge; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
                </li>
                <li class="list-group-item"> 
                  <a href="metrics.html#ITS_BUGS_OPEN"><strong>Number of open bugs</strong></a> (ITS_BUGS_OPEN)<br />
                  <p><span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &gt; 500 &ge; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &gt; 200 &ge; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &gt; 100 &ge; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &gt; 50 &ge; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
                </li>
                <li class="list-group-item"> 
                  <a href="metrics.html#ITS_FIX_MED_1M"><strong>Median time to fix bug</strong></a> (ITS_FIX_MED_1M)<br />
                  <p><span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &gt; 1001.13 &ge; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &gt; 40.2625 &ge; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &gt; 11.62 &ge; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &gt; 3.82 &ge; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
                </li>
                <li class="list-group-item">
                  <a href="metrics.html#ITS_UPDATES_1M"><strong>ITS updates</strong></a> (ITS_UPDATES_1M)<br />
                  <p><span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 4 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 13 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 37 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 596 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
                </li>
              </ul>

              <p>The initial set of thresholds for MLS metrics in Grimoire is the following. These thresholds are used for both the developer and user mailing lists (when available).</p>

              <ul class="list-group">
                <li class="list-group-item">
                  <a href="metrics.html#MLS_DEV_AUTH_1M"><strong>Developer ML authors</strong></a> (MLS_DEV_AUTH_1M)<br />
                  <p><span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 1.5 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 3 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 7.5 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 26 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
                </li>
                <li class="list-group-item">
                  <a href="metrics.html#MLS_DEV_RESP_RATIO_1M"><strong>Developer ML response ratio</strong></a> (MLS_DEV_RESP_RATIO_1M)<br />
                  <p><span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 0.833333333333 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 1.24285714286 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 2.5125 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 10 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
                </li>
                <li class="list-group-item"> 
                  <a href="metrics.html#MLS_DEV_RESP_TIME_MED_1M"><strong>Developer ML response time</strong></a> (MLS_DEV_RESP_TIME_MED_1M)<br />
                  <p><span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &gt; 42.93 &ge; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &gt; 0.94 &ge; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &gt; 0.26 &ge; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &gt; 0.0425 &ge; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
                </li>
                <li class="list-group-item"> 
                  <a href="metrics.html#MLS_DEV_SUBJ_1M"><strong>Developer ML subjects</strong></a> (MLS_DEV_SUBJ_1M)<br />
                  <p><span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 1 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 5 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 15 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 30 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
                </li>
                <li class="list-group-item"> 
                  <a href="metrics.html#MLS_DEV_VOL_1M"><strong>Developer ML posts</strong></a> (MLS_DEV_VOL_1M)<br />
                  <p><span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 2 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 6 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 22 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 103 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
                </li>
              </ul>
              
              <hr />
              
              <h4>Discussion</h4>
            
              <p>In order to make those metrics relative according to the first version of the maturity model, the lines of code were retrieved with an ad-hoc script. Those were based on the 471 Git repositories already mentioned. Excepted when explicitely stated, metrics are made relative using thousands of lines of code (KSLOC).</p>

              <p>Note: All of the Git repositories with no activity during the last month have been removed in the calculation of thresholds. From the original set, only 152/172 projects contained activity. It should also be noted that there may be several git repositories for a single project and set of mailing lists.</p>

