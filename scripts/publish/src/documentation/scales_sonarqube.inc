
        <div id="page-wrapper">
          <div class="row">
            <div class="col-lg-12">

              <h3>Scales &gt; SonarQube</h3>
            
              <p><a href="http://www.sonarqube.org">SonarQube</a> provides source code metrics for projects. There is a <a href="https://dev.eclipse.org/sonar/">dedicated instance</a> of SonarQube within the Eclipse foundation, and <a href="https://wiki.eclipse.org/Sonar">projects are welcome to use it</a>. At the time of writting there are only 32 projects configured in SonarQube.</p>
              <p>This information is based on the information provided by the instance of the tool for some projects of the Eclipse Foundation: <a href="https://dev.eclipse.org/sonar">https://dev.eclipse.org/sonar</a>.</p>
              
              <hr />
              
              <h4>Thresholds</h4>

              <p>The initial set of thresholds for SCM metrics in Grimoire is the following.</p>

              <ul class="list-group">
                <li class="list-group-item">
                  <a href="metrics.html#CLONE_IDX"><strong>Cloning density</strong></a> (CLONE_IDX)<br />
                  <p><span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &gt; 50 &ge; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &gt; 40 &ge; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &gt; 30 &ge; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &gt; 10 &ge; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
                </li>
                <li class="list-group-item">
                  <a href="metrics.html#COMR"><strong>Comment rate</strong></a> (COMR)<br />
                  <p><span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 15.35 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 19.45 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 23.99 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 33.2 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
                </li>
                <li class="list-group-item"> 
                  <a href="metrics.html#SLOC"><strong>Source Lines Of Code</strong></a> (SLOC)<br />
                  <p><span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &gt; 915828 &ge; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &gt; 198290.25 &ge; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &gt; 97961.5 &ge; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &gt; 38776.25 &ge; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
                </li>
                <li class="list-group-item"> 
                  <a href="metrics.html#TST_COV_BRANCHES"><strong>Percentage of branches covered by tests</strong></a> (TST_COV_BRANCHES)<br />
                  <p><span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 0 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 15 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 36.5 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 73.3 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
                </li>
                <li class="list-group-item"> 
                  <a href="metrics.html#TST_COV_LINES"><strong>Percentage of lines of code covered by tests</strong></a> (TST_COV_LINES)<br />
                  <p><span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 0 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 20 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 48.89 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 87.7 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
                </li>
                <li class="list-group-item"> 
                  <a href="metrics.html#TST_SUCCESS_LAST"><strong>Test success density</strong></a> (TST_SUCCESS_LAST)<br />
                  <p><span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 50 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 65 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 80 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 95 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
                </li>
                <li class="list-group-item"> 
                  <a href="metrics.html#TST_VOL_IDX"><strong>Number of tests relative to the code size</strong></a> (TST_VOL_IDX)<br />
                  <p><span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 2 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 5 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 7 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 10 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
                </li>
                <li class="list-group-item"> 
                  <a href="metrics.html#VG"><strong>Average Cyclomatic Complexity</strong></a> (VG)<br />
                  <p><span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &gt; 5.29999 &ge; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &gt; 3.02499 &ge; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &gt; 2.79999 &ge; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &gt; 2.375 &ge; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
                </li>
              </ul>
              
              <hr />
              
              <h4>Discussion</h4>
            
              <p>In order to make those metrics relative according to the first version of the maturity model, the lines of code were retrieved with an ad-hoc script. Those were based on the 471 Git repositories already mentioned. Excepted when explicitely stated, metrics are made relative using thousands of lines of code (KSLOC).</p>

              <p>Note: All of the Git repositories with no activity during the last month have been removed in the calculation of thresholds. From the original set, only 152/172 projects contained activity. It should also be noted that there may be several git repositories for a single project and set of mailing lists.</p>

            </div>
          </div>
        </div>
