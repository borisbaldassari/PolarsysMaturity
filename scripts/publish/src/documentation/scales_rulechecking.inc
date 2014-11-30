
        <div id="page-wrapper">
          <div class="row">
            <div class="col-lg-12">

              <h3>Scales &gt; Rule-checking</h3>

              <p>Well-known open-source tools like PMD and FindBugs help projects find bad patterns in their code: e.g. naming conventions, idiomatic usage, common errors. These rules can be considered as <em>coding practices</em> in the project, and are classified according to the quality attribute(s) they impact.</p> 
              <p>There are two important informations we retrieve from the output of these tools: firstly the number of violations for each category (analysability, changeability, etc.), which shows the effort needed to get rid of a bad practice or acquire a new good practice. The second measure is the percentage of acquired practices, which is the amount of rules <em>never</em> violated in the project.</p>
              <p>One may want to address first the rules that are only violated a couple of times, so it is easy to acquire this practice by simply removing the few violations. By doing such small steps the project can really learn from it and improve its practices.</p>
              
              <p>The evaluation for rules is manual, since it implies compiling the code or retrieving binaries (class files) for FindBugs. To setup the scales, we selected a list of projects and applied our analysis script on the resulting set.</p>
              
              <h4>Thresholds</h4>

              <p>The initial set of thresholds for metrics for rules impacting <strong>Analysability</strong> is the following.</p>
              
              <ul class="list-group">
                <li class="list-group-item">
                  <a href="metrics.html#NCC_ANA_IDX"><strong>Average number of non-conformities for analysability</strong></a> (NCC_ANA_IDX)<br />
                  <p><span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 2 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 5 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 10 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 100 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
                </li>
                  <a href="metrics.html#ROKR_ANA"><strong>Adherence to analysability rules</strong></a> (ROKR_ANA)<br />
                  <p><span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 20 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2 </span> &lt; 40 &le; <span class="label label-scale" style="background-color: #99E633;"> 3 </span> &lt; 60 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4 </span> &lt; 80 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
                </li>
              </ul>
              
              <p>The initial set of thresholds for metrics for rules impacting <strong>Changeability</strong> is the following.</p>


              <h4>List of projects used for the benchmark</h4>
              
              <ul class="list-group">
                <li class="list-group-item"><a href="https://www.polarsys.org/projects/polarsys.capella">Capella</a></li>
                <li class="list-group-item"><a href="http://www.eclipse.org/cdt/">CDT</a></li>
                <li class="list-group-item"><a href="https://www.eclipse.org/ease/">Eclipse Advanced Scripting Environment (EASE)</a></li>
                <li class="list-group-item"><a href="https://www.eclipse.org/egit">Egit</a></li>
                <li class="list-group-item"><a href="https://www.eclipse.org/emf/compare/">EMF-Compare</a></li>
                <li class="list-group-item"><a href="https://www.polarsys.org/projects/polarsys.capella">Capella</a></li>
                <li class="list-group-item"><a href="http://www.eclipse.org/proposals/modeling.gendoc/">Gendoc2</a></li>
                <li class="list-group-item"><a href="https://www.eclipse.org/hudson/">Hudson</a></li>
                <li class="list-group-item"><a href="http://www.eclipse.org/proposals/polarsys.kitalpha/">Kitalpha</a></li>
                <li class="list-group-item"><a href="http://www.eclipse.org/mylyn/">Mylyn</a></li>
                <li class="list-group-item"><a href="http://www.projects.eclipse.org/projects/tools.oomph">Oomph</a></li>
                <li class="list-group-item"><a href="http://www.eclipse.org/papyrus/">Papyrus</a></li>
                <li class="list-group-item"><a href="http://www.polarsys.org/projects/polarsys.reqcycle">ReqCycle</a></li>
                <li class="list-group-item"><a href="http://www.eclipse.org/sirius/">Sirius</a></li>
                <li class="list-group-item"><a href="http://www.eclipse.org/sisu/">Sisu</a></li>
                <li class="list-group-item"><a href="http://www.eclipse.org/subversive/">Subversive</a></li>
              </ul>
              
            </div>
          </div>
        </div>
