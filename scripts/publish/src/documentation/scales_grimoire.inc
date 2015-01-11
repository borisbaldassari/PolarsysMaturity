
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
              
              <hr />
              
              <h4>Thresholds</h4>

              <p>The initial set of thresholds for SCM metrics in Grimoire is the following.</p>

              <ul class="list-group">
                <li class="list-group-item">
                  <a href="metrics.html#SCM_COMMITS_1M"><strong>Number of commits</strong></a> (SCM_COMMITS_1M)<br />
                  <p><span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 0.025078279624 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 0.0756446929809 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 0.264255236791 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 2.54688585321 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
                </li>
                <li class="list-group-item">
                  <a href="metrics.html#SCM_COMMITTERS_1M"><strong>Number of committers</strong></a> (SCM_COMMITTERS_1M)<br />
                  <p><span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 0.00869816603364 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 0.0242054327998 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 0.0757305045383 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 1.47492625369 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
                </li>
                <li class="list-group-item"> 
                  <a href="metrics.html#SCM_COMMITTED_FILES_1M"><strong>Number of committed files</strong></a> (SCM_COMMITTED_FILES_1M)<br />
                  <p><span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 0.069052601156 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 0.294543274794 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 0.948385435841 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 38.8978930308 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
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
                  <p><span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 0.00791505127095 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 0.0229812226388 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 0.0527769809755 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 9.09090909091 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
                </li>
                <li class="list-group-item">
                  <a href="metrics.html#ITS_BUGS_DENSITY"><strong>Defect density</strong></a> (ITS_BUGS_DENSITY)<br />
                  <p><span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &gt; 3.36826347305 &ge; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &gt; 0.0755602867593 &ge; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &gt; 0.0335380213652 &ge; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &gt; 0.009367219332 &ge; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
                </li>
                <li class="list-group-item"> 
                  <a href="metrics.html#ITS_BUGS_OPEN"><strong>Number of open bugs</strong></a> (ITS_BUGS_OPEN)<br />
                  <p><span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &gt; 3.36826347305 &ge; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &gt; 0.0755602867593 &ge; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &gt; 0.0335380213652 &ge; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &gt; 0.009367219332 &ge; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
                </li>
                <li class="list-group-item"> 
                  <a href="metrics.html#ITS_FIX_MED_1M"><strong>Median time to fix bug</strong></a> (ITS_FIX_MED_1M)<br />
                  <p><span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &gt; 1001.13 &ge; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &gt; 40.2625 &ge; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &gt; 11.62 &ge; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &gt; 3.82 &ge; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
                </li>
                <li class="list-group-item">
                  <a href="metrics.html#ITS_UPDATES_1M"><strong>ITS updates</strong></a> (ITS_UPDATES_1M)<br />
                  <p><span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 0.0229586565615 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 0.0757059580589 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 0.193724583492 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 13.0988023952 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
                </li>
              </ul>

              <p>The initial set of thresholds for MLS metrics in Grimoire is the following. These thresholds are used for both the developer and user mailing lists (when available).</p>

              <ul class="list-group">
                <li class="list-group-item">
                  <a href="metrics.html#MLS_DEV_AUTH_1M"><strong>Developer ML authors</strong></a> (MLS_DEV_AUTH_1M)<br />
                  <p><span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 0.00411475861939 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 0.0139607869416 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 0.0461270538934 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 1.49700598802 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
                </li>
                <li class="list-group-item">
                  <a href="metrics.html#MLS_DEV_RESP_RATIO_1M"><strong>Developer ML response ratio</strong></a> (MLS_DEV_RESP_RATIO_1M)<br />
                  <p><span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 0.833333333333 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 1.24285714286 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 2.5125 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 21 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
                </li>
                <li class="list-group-item"> 
                  <a href="metrics.html#MLS_DEV_RESP_TIME_MED_1M"><strong>Developer ML response time</strong></a> (MLS_DEV_RESP_TIME_MED_1M)<br />
                  <p><span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &gt; 42.93 &ge; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &gt; 0.94 &ge; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &gt; 0.26 &ge; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &gt; 0.0425 &ge; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
                </li>
                <li class="list-group-item"> 
                  <a href="metrics.html#MLS_DEV_SUBJ_1M"><strong>Developer ML subjects</strong></a> (MLS_DEV_SUBJ_1M)<br />
                  <p><span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 0.00431595818232 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 0.0167085169953 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 0.0583188863413 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 0.748502994012 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
                </li>
                <li class="list-group-item"> 
                  <a href="metrics.html#MLS_DEV_VOL_1M"><strong>Developer ML posts</strong></a> (MLS_DEV_VOL_1M)<br />
                  <p><span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 0.00765581777287 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 0.0277777777778 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 0.0907806209215 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 1.875 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
                </li>
              </ul>
              
              <hr />
              
              <h4>Discussion</h4>
            
              <p>In order to make those metrics relative according to the first version of the maturity model, the lines of code were retrieved with an ad-hoc script. Those were based on the 471 Git repositories already mentioned. Excepted when explicitely stated, metrics are made relative using thousands of lines of code (KSLOC).</p>

              <p>Note: All of the Git repositories with no activity during the last month have been removed in the calculation of thresholds. From the original set, only 152/172 projects contained activity. It should also be noted that there may be several git repositories for a single project and set of mailing lists.</p>

            </div>
          </div>
        </div>