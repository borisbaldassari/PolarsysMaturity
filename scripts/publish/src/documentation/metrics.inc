
        <div id="page-wrapper">
          <div class="row">
            <div class="col-lg-12">
              <h2>Definition of metrics</h2>
              <p>All metrics used in the maturity assessment process are described thereafter, with useful information and references.</p><br />
        
 
              <div class="tabbable">
                <ul class="nav nav-tabs" role="tablist">
                  <li role="presentation" class="active"><a href="#repo_all" role="tab" data-toggle="tab">All&nbsp;<span class="badge">52</span></a></li>
                  <li role="presentation">
                    <a href="#repo_Grimoire" role="tab" data-toggle="tab">Grimoire&nbsp;<span class="badge">19</span></a></li>
                  <li role="presentation">
                    <a href="#repo_Manual" role="tab" data-toggle="tab">Manual&nbsp;<span class="badge">2</span></a></li>
                  <li role="presentation">
                    <a href="#repo_Marketplace" role="tab" data-toggle="tab">Marketplace&nbsp;<span class="badge">2</span></a></li>
                  <li role="presentation">
                    <a href="#repo_PMI" role="tab" data-toggle="tab">PMI&nbsp;<span class="badge">5</span></a></li>
                  <li role="presentation">
                    <a href="#repo_RuleChecking" role="tab" data-toggle="tab">RuleChecking&nbsp;<span class="badge">8</span></a></li>
                  <li role="presentation">
                    <a href="#repo_SonarQube" role="tab" data-toggle="tab">SonarQube&nbsp;<span class="badge">12</span></a></li>
                  <li role="presentation">
                    <a href="#repo_Unknown" role="tab" data-toggle="tab">Unknown&nbsp;<span class="badge">4</span></a></li>
                </ul>
                <div class="tab-content">
                <div role="tabpanel" class="tab-pane fade in active" id="repo_all"><br />
                  <ul class="list-group">
                <li class="list-group-item"><p id="ATTRS"><strong>Average number of attributes</strong> ( ATTRS )</p>
<p class="desc"><strong>Active</strong>: false</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#ALL_DATA">ALL_DATA</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Average number of attributes defined in a class. This can be compared to the <a href="/documentation/metrics.html#TOPD">total number of operands</a> (TOPD) considered at the class level, and is representative of the data complexity of the class (not including the complexity of methods).</p>
</li>
                <li class="list-group-item"><p id="BRANCH_COVERAGE"><strong>Percentage of branches covered by tests</strong> ( BRANCH_COVERAGE )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#TST_COV">TST_COV</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">The percentage of branches that is exercised by the tests. The SonarQube measure used for this purpose is <mark>branch_coverage</mark>.</p>
<p class="desc">On a given line of code, Line coverage simply answers the following question: Has this line of code been executed during the execution of the unit tests?</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 0 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 15 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 36.5 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 73.3 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                <li class="list-group-item"><p id="COMMENT_LINES_DENSITY"><strong>Comment rate</strong> ( COMMENT_LINES_DENSITY )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#CODE_DOC">CODE_DOC</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">The ratio of source lines of code on the number of comment lines of code.</p>
<p class="desc">Density of comment lines = Comment lines / (Lines of code + Comment lines) * 100. With such a formula, <var>50%</var> means that the number of lines of code equals the number of comment lines and <var>100%</var> means that the file only contains comment lines. The SonarQube measure used for this purpose is <mark>comment_lines_density</mark>. </p>
<p class="desc">See also SonarQube's page on comment lines metrics: <a href="http://docs.sonarqube.org/display/SONAR/Metrics+-+Comment+lines">http://docs.sonarqube.org/display/SONAR/Metrics+-+Comment+lines</a>.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 15.35 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 19.45 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 23.99 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 33.2 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                <li class="list-group-item"><p id="DL_REPO_1M"><strong>Number of downloads on the web site</strong> ( DL_REPO_1M )</p>
<p class="desc"><strong>Active</strong>: false</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#DOWNLOADS">DOWNLOADS</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">The number of downloads on the web site of the project (download page) during last month. Example of download page (for CDT) : http://www.eclipse.org/downloads/ .</p>
</li>
                <li class="list-group-item"><p id="DL_UPDATE_SITE_1M"><strong>Number of downloads on update site</strong> ( DL_UPDATE_SITE_1M )</p>
<p class="desc"><strong>Active</strong>: false</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#DOWNLOADS">DOWNLOADS</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">The number of downloads on the update site of the project during last month. Is computed using successful and failed installs from marketplace.</p>
</li>
                <li class="list-group-item"><p id="DUPLICATED_LINES_DENSITY"><strong>Cloning density</strong> ( DUPLICATED_LINES_DENSITY )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#CODE_CLONE">CODE_CLONE</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">The amount of duplicated lines in the code, divided by the number of lines. This is expressed as a percentage; The SonarQube metric used for this purpose is <mark>duplicated_lines_density</mark>.</p>
<p class="desc">See also SonarQube's definition for duplications: <a href="http://docs.sonarqube.org/display/SONAR/Metric+definitions#Metricdefinitions-Duplications">http://docs.sonarqube.org/display/SONAR/Metric+definitions#Metricdefinitions-Duplications</a>. There is a longer description of the code cloning algorithm here: <a href="http://docs.sonarqube.org/display/SONAR/Duplications">http://docs.sonarqube.org/display/SONAR/Duplications</a>.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &gt; 50 &ge; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &gt; 40 &ge; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &gt; 30 &ge; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &gt; 10 &ge; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                <li class="list-group-item"><p id="FUNCTION_COMPLEXITY"><strong>Average Cyclomatic Complexity</strong> ( FUNCTION_COMPLEXITY )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#CPX">CPX</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">The average number of execution paths found in functions.</p>
<p class="desc">Basically, the counter is incremented every time the control flow of the function splits, with any function having at least a cyclomatic number of 1. The sum of cyclomatic numbers for all functions is then divided by the number of functions. In SonarQube the measure is <code>function_complexity</code>.</p>
<p class="desc">The cyclomatic number is a measure borrowed from graph theory and was introduced to software engineering by McCabe in [<a href="/documentation/references.html">McCabe1976</a>]. It is defined as the number of linearly independent paths that comprise the program. To have good testability and maintainability, McCabe recommends that no program modules (or functions as for Java) should exceed a cyclomatic number of 10. It is primarily defined at the function level and is summed up for higher levels of artefacts.</p>
<p class="desc">See also Wikipedia's entry on cyclomatic complexity: <a href="http://en.wikipedia.org/wiki/Cyclomatic_complexity">http://en.wikipedia.org/wiki/Cyclomatic_complexity</a>.</p>
<p class="desc">See also SonarQube's definition for code complexity: <a href="http://docs.sonarqube.org/display/SONAR/Metrics+-+Complexity">http://docs.sonarqube.org/display/SONAR/Metrics+-+Complexity</a>. There is also a discussion about its meaning here: <a href="http://www.sonarqube.org/discussing-cyclomatic-complexity/">http://www.sonarqube.org/discussing-cyclomatic-complexity/</a></p>
<p class="desc">See also the Maisqual wiki for more details on complexity measures: <a href="http://maisqual.squoring.com/wiki/index.php/Category:Complexity_Metrics">http://maisqual.squoring.com/wiki/index.php/Category:Complexity_Metrics</a>.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &gt; 500 &ge; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &gt; 400 &ge; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &gt; 300 &ge; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &gt; 100 &ge; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                <li class="list-group-item"><p id="IP_LOG_COV"><strong>IP log code coverage</strong> ( IP_LOG_COV )</p>
<p class="desc"><strong>Active</strong>: false</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#IP_LOG">IP_LOG</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Percentage of contributions covered by an appropriate IP log.</p>
<p class="desc">Eclipse foundation has a very strict <a href="https://www.eclipse.org/org/documents/Eclipse_IP_Policy.pdf">IP policy</a> and this measure should always be 100%.</p>
</li>
                <li class="list-group-item"><p id="ITS_AUTH_1M"><strong>ITS authors</strong> ( ITS_AUTH_1M )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#ITS_USAGE">ITS_USAGE</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Number of distinct identities updating tickets during the last month, in the issue tracking system.</p>
<p class="desc">The subset of tickets considered from the issue tracking system are those specified in the project documentation, for example by specifying a tracker or a project name appearing in ticket data. Update means an operation on a ticket changing its state, or adding information. Opening and closing a ticket are considered as updates. Identities of updaters are the character strings found in the corresponding field in the ticket information. Last month is measured as one calendar month period starting the day before the data retrieval (example: if retrieval is on Feb 3rd, period is from Jan 3rd to Feb 2nd, both included).</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 2 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 4 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 9.75 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 80 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                <li class="list-group-item"><p id="ITS_BUGS_DENSITY"><strong>Defect density</strong> ( ITS_BUGS_DENSITY )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#ITS_REL">ITS_REL</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Ratio of the total number of tickets in the issue tracking system to the size of the source code in KLOC, at the time of the data retrieval. </p>
<p class="desc">The subset of tickets considered from the issue tracking system are those specified in the project documentation, for example by specifying a tracker or a project name appearing in ticket data. Source code is all source code found in the source code management repository.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &gt; 3.36826347305 &ge; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &gt; 0.0755602867593 &ge; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &gt; 0.0335380213652 &ge; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &gt; 0.009367219332 &ge; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                <li class="list-group-item"><p id="ITS_BUGS_OPEN"><strong>Number of open bugs</strong> ( ITS_BUGS_OPEN )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#ITS_REL">ITS_REL</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Number of tickets marked as still open at the time of the data retrieval, in the issue tracking system.</p>
<p class="desc">The subset of tickets considered from the issue tracking system are those specified in the project documentation, for example by specifying a tracker or a project name appearing in ticket data. Open means the state in which further actions are usually expected until the ticket is closed.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &gt; 3.36826347305 &ge; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &gt; 0.0755602867593 &ge; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &gt; 0.0335380213652 &ge; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &gt; 0.009367219332 &ge; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                <li class="list-group-item"><p id="ITS_FIX_MED_1M"><strong>Median time to fix bug</strong> ( ITS_FIX_MED_1M )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#ITS_REL">ITS_REL</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Median period from when a ticket is open to when a ticket is closed, for all tickets closed during the last month, in the issue tracking system. </p>
<p class="desc">The subset of tickets considered from the issue tracking system are those specified in the project documentation, for example by specifying a tracker or a project name appearing in ticket data. Closed means the state in which no further action is usually performed in the ticket. Last month is measured as one calendar month period starting the day before the data retrieval (example: if retrieval is on Feb 3rd, period is from Jan 3rd to Feb 2nd, both included). Unit is days.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &gt; 1001.13 &ge; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &gt; 40.2625 &ge; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &gt; 11.62 &ge; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &gt; 3.82 &ge; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                <li class="list-group-item"><p id="ITS_UPDATES_1M"><strong>ITS updates</strong> ( ITS_UPDATES_1M )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#ITS_USAGE">ITS_USAGE</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Number of updates to tickets during the last month, in the issue tracking system.</p>
<p class="desc">The subset of tickets considered from the issue tracking system are those specified in the project documentation, for example by specifying a tracker or a project name appearing in ticket data. Update means an operation on a ticket changing its state, or adding information. Opening and closing a ticket are considered as updates. Last month is measured as one calendar month period starting the day before the data retrieval (example: if retrieval is on Feb 3rd, period is from Jan 3rd to Feb 2nd, both included).</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 4 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 13 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 37 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 596 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                <li class="list-group-item"><p id="LIC_IDENT"><strong>License identification</strong> ( LIC_IDENT )</p>
<p class="desc"><strong>Active</strong>: false</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#LIC">LIC</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Is there a list of the different licences used in the product?</p>
<p class="desc">This measure may use an external tool like Ninka (<a href="http://ninka.turingmachine.org/">ninka.turingmachine.org</a>) to identify the licence of components used in the project. Another way would be to identify a file named LICENCES in the root folder.</p>
</li>
                <li class="list-group-item"><p id="LINE_COVERAGE"><strong>Percentage of lines of code covered by tests</strong> ( LINE_COVERAGE )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#TST_COV">TST_COV</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">The percentage of source lines of code that is exercised by the tests. The SonarQube measure used for this purpose is <mark>line_coverage</mark>.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 0 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 20 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 48.89 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 87.7 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                <li class="list-group-item"><p id="MDIT"><strong>Depth of Inheritance Tree</strong> ( MDIT )</p>
<p class="desc"><strong>Active</strong>: false</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#CPX">CPX</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">The maximum depth of inheritance tree of a class within the inheritance hierarchy is defined as the maximum length from the considered class to the root of the class hierarchy tree and is measured by the number of ancestor classes. In cases involving multiple inheritance, the MDIT is the maximum length from the node to the root of the tree [<a href="/documentation/references.html#Chidamber1994">Chidamber1994</a>].</p>
<p class="desc">A deep inheritance tree makes the understanding of the object-oriented architecture difficult. Well structured OO systems have a forest of classes rather than one large inheritance lattice. The deeper the class is within the hierarchy, the greater the number of methods it is likely to inherit, making it more complex to predict its behavior and, therefore, more fault-prone [<a href="/documentation/references.html#Chidamber1994">Chidamber1994</a>]. However, the deeper a particular tree is in a class, the greater potential reuse of inherited methods [<a href="/documentation/references.html#Chidamber1994">Chidamber1994</a>].</p>
<p class="desc">See also SonarQube's page on the depth in tree: <a href="http://docs.sonarqube.org/display/SONAR/Metrics+-+Depth+in+Tree">http://docs.sonarqube.org/display/SONAR/Metrics+-+Depth+in+Tree</a></p>
</li>
                <li class="list-group-item"><p id="METHS"><strong>Average number of methods</strong> ( METHS )</p>
<p class="desc"><strong>Active</strong>: false</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#ALL_DATA">ALL_DATA</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Average number of methods defined in the class. This can be compared to the <a href="/documentation/metrics.html#TOPD">total number of operators</a> (TOPT) considered at the class level.</p>
</li>
                <li class="list-group-item"><p id="MKT_FAV"><strong>Number of favourites on the Marketplace</strong> ( MKT_FAV )</p>
<p class="desc"><strong>Active</strong>: false</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#MKT_FEEDBACK">MKT_FEEDBACK</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">The number of favourites on the Eclipse Marketplace for the project.</p>
<p class="desc">This measure uses the MarketPlace REST API to retrieve the number of registered users who marked this project as a favourite. If the project is not registered on the Marketplace, the metric should be zero.</p>
</li>
                <li class="list-group-item"><p id="MKT_INSTALL_SUCCESS_1M"><strong>Number of successfull installs on the Marketplace</strong> ( MKT_INSTALL_SUCCESS_1M )</p>
<p class="desc"><strong>Active</strong>: false</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#INSTALL">INSTALL</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">The number of successful installs for the project as reported on the Marketplace during the last month.</p>
<p class="desc">This measure uses the list of successful installs available on the Marketplace for every registered project. Here is <a href="http://marketplace.eclipse.org/content/eclipse-cdt-cc-development-tooling">an example of log page</a>, metrics tab. If the project is not registered on the Marketplace, the metric should be zero.</p>
</li>
                <li class="list-group-item"><p id="MLS_DEV_AUTH_1M"><strong>Developer ML authors</strong> ( MLS_DEV_AUTH_1M )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#MLS_DEV_ACTIVITY">MLS_DEV_ACTIVITY</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Number of distinct senders for messages dated during the last month, in developer mailing list archives. </p>
<p class="desc">Developer mailing list is the list or lists considered as 'for developers' in the project documentation. The date used is the mailing list server date, as stamped in the message. Last month is measured as one calendar month period starting the day before the data retrieval (example: if retrieval is on Feb 3rd, period is from Jan 3rd to Feb 2nd, both included). Distinct senders are those with distinct email addresses. Email addresses used are the strings found in 'From:' fields in messages.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 1.5 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 3 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 7.5 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 26 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                <li class="list-group-item"><p id="MLS_DEV_RESP_RATIO_1M"><strong>Developer ML response ratio</strong> ( MLS_DEV_RESP_RATIO_1M )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#MLS_DEV_SUPPORT">MLS_DEV_SUPPORT</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Average number of messages in thread, minus one, for all threds of messages dated during the last month, in developer mailing list archives. </p>
<p class="desc">Threads are identified using 'In-Reply-To' message headers. Developer mailing list is the list or lists considered as 'for developers' in the project documentation. The date used is the mailing list server date, as stamped in the message. Last month is measured as one calendar month period starting the day before the data retrieval (example: if retrieval is on Feb 3rd, period is from Jan 3rd to Feb 2nd, both included).</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 0.833333333333 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 1.24285714286 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 2.5125 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 21 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                <li class="list-group-item"><p id="MLS_DEV_RESP_TIME_MED_1M"><strong>Developer ML response time</strong> ( MLS_DEV_RESP_TIME_MED_1M )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#MLS_DEV_RESPONSIVENESS">MLS_DEV_RESPONSIVENESS</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Median period from first message in thread to second message in thread, for all threds with at least two messages dated during the last month, in developer mailing list archives. </p>
<p class="desc">Threads are identified using 'In-Reply-To' message headers. Developer mailing list is the list or lists considered as 'for developers' in the project documentation. The date used is the mailing list server date, as stamped in the message. Last month is measured as one calendar month period starting the day before the data retrieval (example: if retrieval is on Feb 3rd, period is from Jan 3rd to Feb 2nd, both included). Unit is days.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &gt; 42.93 &ge; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &gt; 0.94 &ge; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &gt; 0.26 &ge; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &gt; 0.0425 &ge; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                <li class="list-group-item"><p id="MLS_DEV_SUBJ_1M"><strong>Developer ML subjects</strong> ( MLS_DEV_SUBJ_1M )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#MLS_DEV_SUPPORT">MLS_DEV_SUPPORT</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Number of threads of messages dated during the last month, in developer mailing list archives. </p>
<p class="desc">Threads are identified using 'In-Reply-To' message headers. Developer mailing list is the list or lists considered as 'for developers' in the project documentation. The date used is the mailing list server date, as stamped in the message. Last month is measured as one calendar month period starting the day before the data retrieval (example: if retrieval is on Feb 3rd, period is from Jan 3rd to Feb 2nd, both included).</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 0.00431595818232 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 0.0167085169953 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 0.0583188863413 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 0.748502994012 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                <li class="list-group-item"><p id="MLS_DEV_VOL_1M"><strong>Developer ML posts</strong> ( MLS_DEV_VOL_1M )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#MLS_DEV_ACTIVITY">MLS_DEV_ACTIVITY</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Number of messages dated during the last month, in developer mailing list archives.</p>
<p class="desc">Developer mailing list is the list or lists considered as 'for developers' in the project documentation. The date used is the mailing list server date, as stamped in the message. Last month is measured as one calendar month period starting the day before the data retrieval (example: if retrieval is on Feb 3rd, period is from Jan 3rd to Feb 2nd, both included).</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 2 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 6 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 22 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 103 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                <li class="list-group-item"><p id="MLS_USR_AUTH_1M"><strong>User ML authors</strong> ( MLS_USR_AUTH_1M )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#MLS_USR_DIVERSITY">MLS_USR_DIVERSITY</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Number of distinct senders for messages dated during the last month, in user mailing list archives.</p>
<p class="desc">User mailing list is the list or lists considered as 'for users' in the project documentation. The date used is the mailing list server date, as stamped in the message. Last month is measured as one calendar month period starting the day before the data retrieval (example: if retrieval is on Feb 3rd, period is from Jan 3rd to Feb 2nd, both included). Distinct senders are those with distinct email addresses. Email addresses used are the strings found in 'From:' fields in messages.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 1.5 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 3 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 7.5 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 26 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                <li class="list-group-item"><p id="MLS_USR_RESP_RATIO_1M"><strong>User ML response ratio</strong> ( MLS_USR_RESP_RATIO_1M )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#MLS_USR_SUPPORT">MLS_USR_SUPPORT</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Average number of messages in thread, minus one, for all threds of messages dated during the last month, in user mailing list archives. </p>
<p class="desc">Threads are identified using 'In-Reply-To' message headers. User mailing list is the list or lists considered as 'for users' in the project documentation. The date used is the mailing list server date, as stamped in the message. Last month is measured as one calendar month period starting the day before the data retrieval (example: if retrieval is on Feb 3rd, period is from Jan 3rd to Feb 2nd, both included).</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 0.833333333333 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 1.24285714286 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 2.5125 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 21 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                <li class="list-group-item"><p id="MLS_USR_RESP_TIME_MED_1M"><strong>User ML response time</strong> ( MLS_USR_RESP_TIME_MED_1M )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#MLS_USR_RESPONSIVENESS">MLS_USR_RESPONSIVENESS</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Median period from first message in thread to second message in thread, for all threds with at least two messages dated during the last month, in user mailing list archives. </p>
<p class="desc">Threads are identified using 'In-Reply-To' message headers. User mailing list is the list or lists considered as 'for users' in the project documentation. The date used is the mailing list server date, as stamped in the message. Last month is measured as one calendar month period starting the day before the data retrieval (example: if retrieval is on Feb 3rd, period is from Jan 3rd to Feb 2nd, both included). Unit is days.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &gt; 42.93 &ge; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &gt; 0.94 &ge; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &gt; 0.26 &ge; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &gt; 0.0425 &ge; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                <li class="list-group-item"><p id="MLS_USR_SUBJ_1M"><strong>User ML subjects</strong> ( MLS_USR_SUBJ_1M )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#MLS_USR_SUPPORT">MLS_USR_SUPPORT</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Number of threds of messages dated during the last month, in user mailing list archives.</p>
<p class="desc">Threads are identified using 'In-Reply-To' message headers. User mailing list is the list or lists considered as 'for users' in the project documentation. The date used is the mailing list server date, as stamped in the message. Last month is measured as one calendar month period starting the day before the data retrieval (example: if retrieval is on Feb 3rd, period is from Jan 3rd to Feb 2nd, both included).</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 0.00431595818232 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 0.0167085169953 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 0.0583188863413 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 0.748502994012 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                <li class="list-group-item"><p id="MLS_USR_VOL_1M"><strong>User ML posts</strong> ( MLS_USR_VOL_1M )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#MLS_USR_ACTIVITY">MLS_USR_ACTIVITY</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Number of messages dated during the last month, in user mailing list archives. </p>
<p class="desc">User mailing list is the list or lists considered as 'for users' in the project documentation. The date used is the mailing list server date, as stamped in the message. Last month is measured as one calendar month period starting the day before the data retrieval (example: if retrieval is on Feb 3rd, period is from Jan 3rd to Feb 2nd, both included).</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 0.00765581777287 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 0.0277777777778 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 0.0907806209215 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 1.875 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                <li class="list-group-item"><p id="NCC_ANA_IDX"><strong>Average number of non-conformities for analysability</strong> ( NCC_ANA_IDX )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#PRACTICES_ANA">PRACTICES_ANA</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">The total number of violations of rules that impact analysability in the source code, divided by the number of thousands of lines of code.</p>
<p class="desc">See also the <a href="/documentation/rules.html">page on practices</a> for a list of checked rules and their associated impact on quality characteristics.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &gt; 50 &ge; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &gt; 30 &ge; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &gt; 20 &ge; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &gt; 10 &ge; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                <li class="list-group-item"><p id="NCC_CHA_IDX"><strong>Average number of non-conformities for changeability</strong> ( NCC_CHA_IDX )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#PRACTICES_CHA">PRACTICES_CHA</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">The total number of violations of rules that impact changeability in the source code, divided by the number of thousands of lines of code.</p>
<p class="desc">See also the <a href="/documentation/rules.html">page on practices</a> for a list of checked rules and their associated impact on quality characteristics.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &gt; 20 &ge; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &gt; 10 &ge; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &gt; 5 &ge; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &gt; 3 &ge; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                <li class="list-group-item"><p id="NCC_REL_IDX"><strong>Average number of non-conformities for reliability</strong> ( NCC_REL_IDX )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#PRACTICES_REL">PRACTICES_REL</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">The total number of violations of rules that impact reliability in the source code, divided by the number of thousands of lines of code.</p>
<p class="desc">See also the <a href="/documentation/rules.html">page on practices</a> for a list of checked rules and their associated impact on quality characteristics.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &gt; 20 &ge; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &gt; 10 &ge; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &gt; 5 &ge; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &gt; 3 &ge; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                <li class="list-group-item"><p id="NCC_REU_IDX"><strong>Average number of non-conformities for reusability</strong> ( NCC_REU_IDX )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#PRACTICES_REU">PRACTICES_REU</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">The total number of violations of rules that impact reusability in the source code, divided by the number of thousands of lines of code.</p>
<p class="desc">See also the <a href="/documentation/rules.html">page on practices</a> for a list of checked rules and their associated impact on quality characteristics.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &gt; 300 &ge; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &gt; 200 &ge; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &gt; 150 &ge; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &gt; 100 &ge; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                <li class="list-group-item"><p id="NCLOC"><strong>Source Lines Of Code</strong> ( NCLOC )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#CODE_SIZE">CODE_SIZE</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Number of physical lines that contain at least one character which is neither a whitespace or a tabulation or part of a comment. This is mapped to SonarQube's <mark>ncloc</mark> metric.</p>
<p class="desc">See also SonarQube's definition for size metrics: <a href="http://docs.sonarqube.org/display/SONAR/Metric+definitions#Metricdefinitions-Size">http://docs.sonarqube.org/display/SONAR/Metric+definitions#Metricdefinitions-Size</a>. More details can be seen here: <a href="http://docs.sonarqube.org/display/SONAR/Metrics+-+Lines+of+code">http://docs.sonarqube.org/display/SONAR/Metrics+-+Lines+of+code</a></p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &gt; 915828 &ge; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &gt; 198290.25 &ge; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &gt; 97961.5 &ge; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &gt; 38776.25 &ge; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                <li class="list-group-item"><p id="PLAN_MILESTONES_VOL"><strong>Number of milestones</strong> ( PLAN_MILESTONES_VOL )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#PLAN_RELEASES">PLAN_RELEASES</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">The number of milestones that occured during the last five releases.</p>
<p class="desc">Milestones are retrieved from the PMI file and are counted whatever their target release is. Milestones are useful to assess the maturity of the release and improves predictability of the project's output, in terms of quality and time.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 1 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 5 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 10 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 20 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                <li class="list-group-item"><p id="PLAN_NEXT_MILESTONE"><strong>Project is on time for next milestone</strong> ( PLAN_NEXT_MILESTONE )</p>
<p class="desc"><strong>Active</strong>: false</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#PLAN_ON_TIME">PLAN_ON_TIME</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Is the project on time for the next milestone?</p>
</li>
                <li class="list-group-item"><p id="PLAN_REVIEWS_SUCCESS_RATE"><strong>Reviews success rate</strong> ( PLAN_REVIEWS_SUCCESS_RATE )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#PLAN_RELEASES">PLAN_RELEASES</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">What is the percentage of successful reviews over the past 5 releases?</p>
<p class="desc">The reviews are retrieved from the project management infrastructure record, and are considered successful if the entry is equal to <mark>success</mark>. If there are less than 5 releases defined, the percentage is computed on these only.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 20 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 40 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 60 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 80 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                <li class="list-group-item"><p id="PUBLIC_API"><strong>Public API</strong> ( PUBLIC_API )</p>
<p class="desc"><strong>Active</strong>: false</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#PUBLIC_DATA">PUBLIC_DATA</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Number of public Classes + number of public Functions + number of public Properties. The SonarQube measure used for this purpose is <mark>public_api</mark>.</p>
<p class="desc">See also SonarQube's definition for size metrics: <a href="http://docs.sonarqube.org/display/SONAR/Metric+definitions#Metricdefinitions-Size">http://docs.sonarqube.org/display/SONAR/Metric+definitions#Metricdefinitions-Size</a>. More details can be seen here: <a href="http://docs.sonarqube.org/display/SONAR/Metrics+-+Public+API">http://docs.sonarqube.org/display/SONAR/Metrics+-+Public+API</a></p>
</li>
                <li class="list-group-item"><p id="PUB_CONF_VOL"><strong>Number of publications</strong> ( PUB_CONF_VOL )</p>
<p class="desc"><strong>Active</strong>: false</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#PUB_CONF">PUB_CONF</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">The number of papers published in conferences, journals, and public web sites.</p>
<p class="desc">This metric is not yet active because its retrieval is being debated.</p>
</li>
                <li class="list-group-item"><p id="PUB_ITS_INFO_PMI"><strong>ITS information</strong> ( PUB_ITS_INFO_PMI )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#PUB_ITS_INFO">PUB_ITS_INFO</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Is the bugzilla info correctly filled in the PMI records?</p>
<p class="desc">The project management infrastructure file holds information about one or more bugzilla instances. This test checks that at least one bugzilla instance is defined, with a product identifier, a create_url to enter a new issue, and a query_url to fetch all the issues for the project.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 2 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 3 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 4 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 5 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                <li class="list-group-item"><p id="PUB_SCM_INFO_PMI"><strong>SCM information</strong> ( PUB_SCM_INFO_PMI )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#PUB_SCM_INFO">PUB_SCM_INFO</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Is the source_repo info correctly filled in the PMI records? </p>
<p class="desc">The project management infrastructure file holds information about one or more source repositories. This test checks that at least one source repository is defined, and accessible.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 1 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 2 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 3 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 4 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                <li class="list-group-item"><p id="ROKR_ANA"><strong>Adherence to analysability rules</strong> ( ROKR_ANA )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#PRACTICES_ANA">PRACTICES_ANA</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Ratio of conform analysability practices on the number of checked analysability practices.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 10 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 30 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 50 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 75 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                <li class="list-group-item"><p id="ROKR_CHA"><strong>Adherence to changeability rules</strong> ( ROKR_CHA )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#PRACTICES_CHA">PRACTICES_CHA</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Ratio of conform changeability practices on the number of checked changeability practices.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 10 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 30 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 50 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 75 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                <li class="list-group-item"><p id="ROKR_REL"><strong>Adherence to reliability rules</strong> ( ROKR_REL )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#PRACTICES_REL">PRACTICES_REL</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Ratio of conform reliability practices on the number of checked reliability practices.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 10 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 30 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 50 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 75 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                <li class="list-group-item"><p id="ROKR_REU"><strong>Adherence to reusability rules</strong> ( ROKR_REU )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#PRACTICES_REU">PRACTICES_REU</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Ratio of conform reusability practices on the number of checked reusability practices.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 10 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 30 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 50 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 75 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                <li class="list-group-item"><p id="SCM_COMMITS_1M"><strong>SCM Commits</strong> ( SCM_COMMITS_1M )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#SCM_ACTIVITY">SCM_ACTIVITY</a>
, <a href="questions.html#SCM_USAGE">SCM_USAGE</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Total number of commits in source code management repositories dated during the last month.</p>
<p class="desc">Source code management repositories are those considered as such in the project documentation. Commits in all branches are considered. Date used for each commit is 'author date' (when there is a difference between author date and committer date). Last month is measured as one calendar month period starting the day before the data retrieval (example: if retrieval is on Feb 3rd, period is from Jan 3rd to Feb 2nd, both included).</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 2 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 5 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 13 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 121 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                <li class="list-group-item"><p id="SCM_COMMITTED_FILES_1M"><strong>Files committed</strong> ( SCM_COMMITTED_FILES_1M )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#SCM_ACTIVITY">SCM_ACTIVITY</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Total number of files touched by commits in source code management repositories dated during the last month.</p>
<p class="desc">Source code management repositories are those considered as such in the project documentation. Commits in all branches are considered. A file is 'touched' by a commit if its content or its path are modified by the commit. Date used for each commit is 'author date' (when there is a difference between author date and committer date). Last month is measured as one calendar month period starting the day before the data retrieval (example: if retrieval is on Feb 3rd, period is from Jan 3rd to Feb 2nd, both included).</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 3 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 19 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 95.75 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 2189 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                <li class="list-group-item"><p id="SCM_COMMITTERS_1M"><strong>SCM committers</strong> ( SCM_COMMITTERS_1M )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#SCM_DIVERSITY">SCM_DIVERSITY</a>
, <a href="questions.html#SCM_USAGE">SCM_USAGE</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Total number of identities found as authors of commits in source code management repositories dated during the last month.</p>
<p class="desc">Source code management repositories are those considered as such in the project documentation. Commits in all branches are considered. Date used for each commit is 'author date' (when there is a difference between author date and committer date). An identity is considered as author if it appears as such in the commit record (for systems logging several identities related to the commit, authoring identity will be considered). Last month is measured as one calendar month period starting the day before the data retrieval (example: if retrieval is on Feb 3rd, period is from Jan 3rd to Feb 2nd, both included).</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 1 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 2 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 3 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 18 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                <li class="list-group-item"><p id="SCM_STABILITY_1M"><strong>File stability index</strong> ( SCM_STABILITY_1M )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#SCM_STABILITY">SCM_STABILITY</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Average number of commits touching each file in source code management repositories dated during the last month. </p>
<p class="desc">Source code management repositories are those considered as such in the project documentation. Commits in all branches are considered. A file is 'touched' by a commit if its content or its path are modified by the commit. Date used for each commit is 'author date' (when there is a difference between author date and committer date). Last month is measured as one calendar month period starting the day before the data retrieval (example: if retrieval is on Feb 3rd, period is from Jan 3rd to Feb 2nd, both included).</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &gt; 3.79487179487 &ge; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &gt; 1.4430952381 &ge; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &gt; 1.14285714286 &ge; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &gt; 1 &ge; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                <li class="list-group-item"><p id="SURVEY_INSTALL"><strong>Installation survey</strong> ( SURVEY_INSTALL )</p>
<p class="desc"><strong>Active</strong>: false</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#INSTALL">INSTALL</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">A survey stating how much the software has been installed: number of users, geography (are the teams co-located or distributed?), etc.</p>
</li>
                <li class="list-group-item"><p id="TEST_SUCCESS_DENSITY"><strong>Test success density</strong> ( TEST_SUCCESS_DENSITY )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#TST_SUCCESS">TST_SUCCESS</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">The percentage of failed tests during the last execution of the test plan. The SonarQube measure used for this purpose is <mark>test_success_density</mark>.</p>
<p class="desc">Computation is as follows: Test success density = (Unit tests - (Unit test errors + Unit test failures)) / Unit tests * 100, where Unit test errors is the number of unit tests that have failed, Unit test failures is the number of unit tests that have failed with an unexpected exception.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 50 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 65 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 80 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 95 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                <li class="list-group-item"><p id="TST_VOL_IDX"><strong>Number of tests relative to the code size</strong> ( TST_VOL_IDX )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#TST_VOL">TST_VOL</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">The total number of test cases for the product, divided by the number of thousands of SLOC.</p>
<p class="desc">Metric is computed from SonarQube <mark>tests</mark> and <mark>ncloc</mark> metrics.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 2 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 5 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 7 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 10 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                  </ul></div>
                  <div role="tabpanel" class="tab-pane fade" id="repo_Grimoire"><br />
                    <ul class="list-group">
                      <li class="list-group-item"><p id="ITS_AUTH_1M"><strong>ITS authors</strong> ( ITS_AUTH_1M )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#ITS_USAGE">ITS_USAGE</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Number of distinct identities updating tickets during the last month, in the issue tracking system.</p>
<p class="desc">The subset of tickets considered from the issue tracking system are those specified in the project documentation, for example by specifying a tracker or a project name appearing in ticket data. Update means an operation on a ticket changing its state, or adding information. Opening and closing a ticket are considered as updates. Identities of updaters are the character strings found in the corresponding field in the ticket information. Last month is measured as one calendar month period starting the day before the data retrieval (example: if retrieval is on Feb 3rd, period is from Jan 3rd to Feb 2nd, both included).</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 2 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 4 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 9.75 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 80 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                      <li class="list-group-item"><p id="ITS_BUGS_DENSITY"><strong>Defect density</strong> ( ITS_BUGS_DENSITY )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#ITS_REL">ITS_REL</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Ratio of the total number of tickets in the issue tracking system to the size of the source code in KLOC, at the time of the data retrieval. </p>
<p class="desc">The subset of tickets considered from the issue tracking system are those specified in the project documentation, for example by specifying a tracker or a project name appearing in ticket data. Source code is all source code found in the source code management repository.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &gt; 3.36826347305 &ge; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &gt; 0.0755602867593 &ge; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &gt; 0.0335380213652 &ge; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &gt; 0.009367219332 &ge; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                      <li class="list-group-item"><p id="ITS_BUGS_OPEN"><strong>Number of open bugs</strong> ( ITS_BUGS_OPEN )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#ITS_REL">ITS_REL</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Number of tickets marked as still open at the time of the data retrieval, in the issue tracking system.</p>
<p class="desc">The subset of tickets considered from the issue tracking system are those specified in the project documentation, for example by specifying a tracker or a project name appearing in ticket data. Open means the state in which further actions are usually expected until the ticket is closed.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &gt; 3.36826347305 &ge; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &gt; 0.0755602867593 &ge; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &gt; 0.0335380213652 &ge; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &gt; 0.009367219332 &ge; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                      <li class="list-group-item"><p id="ITS_FIX_MED_1M"><strong>Median time to fix bug</strong> ( ITS_FIX_MED_1M )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#ITS_REL">ITS_REL</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Median period from when a ticket is open to when a ticket is closed, for all tickets closed during the last month, in the issue tracking system. </p>
<p class="desc">The subset of tickets considered from the issue tracking system are those specified in the project documentation, for example by specifying a tracker or a project name appearing in ticket data. Closed means the state in which no further action is usually performed in the ticket. Last month is measured as one calendar month period starting the day before the data retrieval (example: if retrieval is on Feb 3rd, period is from Jan 3rd to Feb 2nd, both included). Unit is days.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &gt; 1001.13 &ge; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &gt; 40.2625 &ge; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &gt; 11.62 &ge; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &gt; 3.82 &ge; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                      <li class="list-group-item"><p id="ITS_UPDATES_1M"><strong>ITS updates</strong> ( ITS_UPDATES_1M )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#ITS_USAGE">ITS_USAGE</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Number of updates to tickets during the last month, in the issue tracking system.</p>
<p class="desc">The subset of tickets considered from the issue tracking system are those specified in the project documentation, for example by specifying a tracker or a project name appearing in ticket data. Update means an operation on a ticket changing its state, or adding information. Opening and closing a ticket are considered as updates. Last month is measured as one calendar month period starting the day before the data retrieval (example: if retrieval is on Feb 3rd, period is from Jan 3rd to Feb 2nd, both included).</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 4 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 13 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 37 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 596 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                      <li class="list-group-item"><p id="MLS_DEV_AUTH_1M"><strong>Developer ML authors</strong> ( MLS_DEV_AUTH_1M )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#MLS_DEV_ACTIVITY">MLS_DEV_ACTIVITY</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Number of distinct senders for messages dated during the last month, in developer mailing list archives. </p>
<p class="desc">Developer mailing list is the list or lists considered as 'for developers' in the project documentation. The date used is the mailing list server date, as stamped in the message. Last month is measured as one calendar month period starting the day before the data retrieval (example: if retrieval is on Feb 3rd, period is from Jan 3rd to Feb 2nd, both included). Distinct senders are those with distinct email addresses. Email addresses used are the strings found in 'From:' fields in messages.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 1.5 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 3 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 7.5 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 26 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                      <li class="list-group-item"><p id="MLS_DEV_RESP_RATIO_1M"><strong>Developer ML response ratio</strong> ( MLS_DEV_RESP_RATIO_1M )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#MLS_DEV_SUPPORT">MLS_DEV_SUPPORT</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Average number of messages in thread, minus one, for all threds of messages dated during the last month, in developer mailing list archives. </p>
<p class="desc">Threads are identified using 'In-Reply-To' message headers. Developer mailing list is the list or lists considered as 'for developers' in the project documentation. The date used is the mailing list server date, as stamped in the message. Last month is measured as one calendar month period starting the day before the data retrieval (example: if retrieval is on Feb 3rd, period is from Jan 3rd to Feb 2nd, both included).</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 0.833333333333 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 1.24285714286 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 2.5125 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 21 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                      <li class="list-group-item"><p id="MLS_DEV_RESP_TIME_MED_1M"><strong>Developer ML response time</strong> ( MLS_DEV_RESP_TIME_MED_1M )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#MLS_DEV_RESPONSIVENESS">MLS_DEV_RESPONSIVENESS</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Median period from first message in thread to second message in thread, for all threds with at least two messages dated during the last month, in developer mailing list archives. </p>
<p class="desc">Threads are identified using 'In-Reply-To' message headers. Developer mailing list is the list or lists considered as 'for developers' in the project documentation. The date used is the mailing list server date, as stamped in the message. Last month is measured as one calendar month period starting the day before the data retrieval (example: if retrieval is on Feb 3rd, period is from Jan 3rd to Feb 2nd, both included). Unit is days.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &gt; 42.93 &ge; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &gt; 0.94 &ge; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &gt; 0.26 &ge; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &gt; 0.0425 &ge; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                      <li class="list-group-item"><p id="MLS_DEV_SUBJ_1M"><strong>Developer ML subjects</strong> ( MLS_DEV_SUBJ_1M )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#MLS_DEV_SUPPORT">MLS_DEV_SUPPORT</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Number of threads of messages dated during the last month, in developer mailing list archives. </p>
<p class="desc">Threads are identified using 'In-Reply-To' message headers. Developer mailing list is the list or lists considered as 'for developers' in the project documentation. The date used is the mailing list server date, as stamped in the message. Last month is measured as one calendar month period starting the day before the data retrieval (example: if retrieval is on Feb 3rd, period is from Jan 3rd to Feb 2nd, both included).</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 0.00431595818232 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 0.0167085169953 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 0.0583188863413 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 0.748502994012 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                      <li class="list-group-item"><p id="MLS_DEV_VOL_1M"><strong>Developer ML posts</strong> ( MLS_DEV_VOL_1M )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#MLS_DEV_ACTIVITY">MLS_DEV_ACTIVITY</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Number of messages dated during the last month, in developer mailing list archives.</p>
<p class="desc">Developer mailing list is the list or lists considered as 'for developers' in the project documentation. The date used is the mailing list server date, as stamped in the message. Last month is measured as one calendar month period starting the day before the data retrieval (example: if retrieval is on Feb 3rd, period is from Jan 3rd to Feb 2nd, both included).</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 2 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 6 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 22 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 103 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                      <li class="list-group-item"><p id="MLS_USR_AUTH_1M"><strong>User ML authors</strong> ( MLS_USR_AUTH_1M )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#MLS_USR_DIVERSITY">MLS_USR_DIVERSITY</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Number of distinct senders for messages dated during the last month, in user mailing list archives.</p>
<p class="desc">User mailing list is the list or lists considered as 'for users' in the project documentation. The date used is the mailing list server date, as stamped in the message. Last month is measured as one calendar month period starting the day before the data retrieval (example: if retrieval is on Feb 3rd, period is from Jan 3rd to Feb 2nd, both included). Distinct senders are those with distinct email addresses. Email addresses used are the strings found in 'From:' fields in messages.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 1.5 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 3 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 7.5 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 26 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                      <li class="list-group-item"><p id="MLS_USR_RESP_RATIO_1M"><strong>User ML response ratio</strong> ( MLS_USR_RESP_RATIO_1M )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#MLS_USR_SUPPORT">MLS_USR_SUPPORT</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Average number of messages in thread, minus one, for all threds of messages dated during the last month, in user mailing list archives. </p>
<p class="desc">Threads are identified using 'In-Reply-To' message headers. User mailing list is the list or lists considered as 'for users' in the project documentation. The date used is the mailing list server date, as stamped in the message. Last month is measured as one calendar month period starting the day before the data retrieval (example: if retrieval is on Feb 3rd, period is from Jan 3rd to Feb 2nd, both included).</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 0.833333333333 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 1.24285714286 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 2.5125 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 21 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                      <li class="list-group-item"><p id="MLS_USR_RESP_TIME_MED_1M"><strong>User ML response time</strong> ( MLS_USR_RESP_TIME_MED_1M )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#MLS_USR_RESPONSIVENESS">MLS_USR_RESPONSIVENESS</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Median period from first message in thread to second message in thread, for all threds with at least two messages dated during the last month, in user mailing list archives. </p>
<p class="desc">Threads are identified using 'In-Reply-To' message headers. User mailing list is the list or lists considered as 'for users' in the project documentation. The date used is the mailing list server date, as stamped in the message. Last month is measured as one calendar month period starting the day before the data retrieval (example: if retrieval is on Feb 3rd, period is from Jan 3rd to Feb 2nd, both included). Unit is days.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &gt; 42.93 &ge; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &gt; 0.94 &ge; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &gt; 0.26 &ge; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &gt; 0.0425 &ge; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                      <li class="list-group-item"><p id="MLS_USR_SUBJ_1M"><strong>User ML subjects</strong> ( MLS_USR_SUBJ_1M )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#MLS_USR_SUPPORT">MLS_USR_SUPPORT</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Number of threds of messages dated during the last month, in user mailing list archives.</p>
<p class="desc">Threads are identified using 'In-Reply-To' message headers. User mailing list is the list or lists considered as 'for users' in the project documentation. The date used is the mailing list server date, as stamped in the message. Last month is measured as one calendar month period starting the day before the data retrieval (example: if retrieval is on Feb 3rd, period is from Jan 3rd to Feb 2nd, both included).</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 0.00431595818232 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 0.0167085169953 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 0.0583188863413 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 0.748502994012 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                      <li class="list-group-item"><p id="MLS_USR_VOL_1M"><strong>User ML posts</strong> ( MLS_USR_VOL_1M )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#MLS_USR_ACTIVITY">MLS_USR_ACTIVITY</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Number of messages dated during the last month, in user mailing list archives. </p>
<p class="desc">User mailing list is the list or lists considered as 'for users' in the project documentation. The date used is the mailing list server date, as stamped in the message. Last month is measured as one calendar month period starting the day before the data retrieval (example: if retrieval is on Feb 3rd, period is from Jan 3rd to Feb 2nd, both included).</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 0.00765581777287 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 0.0277777777778 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 0.0907806209215 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 1.875 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                      <li class="list-group-item"><p id="SCM_COMMITS_1M"><strong>SCM Commits</strong> ( SCM_COMMITS_1M )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#SCM_ACTIVITY">SCM_ACTIVITY</a>
, <a href="questions.html#SCM_USAGE">SCM_USAGE</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Total number of commits in source code management repositories dated during the last month.</p>
<p class="desc">Source code management repositories are those considered as such in the project documentation. Commits in all branches are considered. Date used for each commit is 'author date' (when there is a difference between author date and committer date). Last month is measured as one calendar month period starting the day before the data retrieval (example: if retrieval is on Feb 3rd, period is from Jan 3rd to Feb 2nd, both included).</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 2 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 5 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 13 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 121 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                      <li class="list-group-item"><p id="SCM_COMMITTED_FILES_1M"><strong>Files committed</strong> ( SCM_COMMITTED_FILES_1M )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#SCM_ACTIVITY">SCM_ACTIVITY</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Total number of files touched by commits in source code management repositories dated during the last month.</p>
<p class="desc">Source code management repositories are those considered as such in the project documentation. Commits in all branches are considered. A file is 'touched' by a commit if its content or its path are modified by the commit. Date used for each commit is 'author date' (when there is a difference between author date and committer date). Last month is measured as one calendar month period starting the day before the data retrieval (example: if retrieval is on Feb 3rd, period is from Jan 3rd to Feb 2nd, both included).</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 3 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 19 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 95.75 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 2189 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                      <li class="list-group-item"><p id="SCM_COMMITTERS_1M"><strong>SCM committers</strong> ( SCM_COMMITTERS_1M )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#SCM_DIVERSITY">SCM_DIVERSITY</a>
, <a href="questions.html#SCM_USAGE">SCM_USAGE</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Total number of identities found as authors of commits in source code management repositories dated during the last month.</p>
<p class="desc">Source code management repositories are those considered as such in the project documentation. Commits in all branches are considered. Date used for each commit is 'author date' (when there is a difference between author date and committer date). An identity is considered as author if it appears as such in the commit record (for systems logging several identities related to the commit, authoring identity will be considered). Last month is measured as one calendar month period starting the day before the data retrieval (example: if retrieval is on Feb 3rd, period is from Jan 3rd to Feb 2nd, both included).</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 1 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 2 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 3 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 18 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                      <li class="list-group-item"><p id="SCM_STABILITY_1M"><strong>File stability index</strong> ( SCM_STABILITY_1M )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#SCM_STABILITY">SCM_STABILITY</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Average number of commits touching each file in source code management repositories dated during the last month. </p>
<p class="desc">Source code management repositories are those considered as such in the project documentation. Commits in all branches are considered. A file is 'touched' by a commit if its content or its path are modified by the commit. Date used for each commit is 'author date' (when there is a difference between author date and committer date). Last month is measured as one calendar month period starting the day before the data retrieval (example: if retrieval is on Feb 3rd, period is from Jan 3rd to Feb 2nd, both included).</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &gt; 3.79487179487 &ge; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &gt; 1.4430952381 &ge; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &gt; 1.14285714286 &ge; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &gt; 1 &ge; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                    </ul>
                  </div>  
                  <div role="tabpanel" class="tab-pane fade" id="repo_Manual"><br />
                    <ul class="list-group">
                      <li class="list-group-item"><p id="PUB_CONF_VOL"><strong>Number of publications</strong> ( PUB_CONF_VOL )</p>
<p class="desc"><strong>Active</strong>: false</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#PUB_CONF">PUB_CONF</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">The number of papers published in conferences, journals, and public web sites.</p>
<p class="desc">This metric is not yet active because its retrieval is being debated.</p>
</li>
                      <li class="list-group-item"><p id="SURVEY_INSTALL"><strong>Installation survey</strong> ( SURVEY_INSTALL )</p>
<p class="desc"><strong>Active</strong>: false</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#INSTALL">INSTALL</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">A survey stating how much the software has been installed: number of users, geography (are the teams co-located or distributed?), etc.</p>
</li>
                    </ul>
                  </div>  
                  <div role="tabpanel" class="tab-pane fade" id="repo_Marketplace"><br />
                    <ul class="list-group">
                      <li class="list-group-item"><p id="MKT_FAV"><strong>Number of favourites on the Marketplace</strong> ( MKT_FAV )</p>
<p class="desc"><strong>Active</strong>: false</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#MKT_FEEDBACK">MKT_FEEDBACK</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">The number of favourites on the Eclipse Marketplace for the project.</p>
<p class="desc">This measure uses the MarketPlace REST API to retrieve the number of registered users who marked this project as a favourite. If the project is not registered on the Marketplace, the metric should be zero.</p>
</li>
                      <li class="list-group-item"><p id="MKT_INSTALL_SUCCESS_1M"><strong>Number of successfull installs on the Marketplace</strong> ( MKT_INSTALL_SUCCESS_1M )</p>
<p class="desc"><strong>Active</strong>: false</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#INSTALL">INSTALL</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">The number of successful installs for the project as reported on the Marketplace during the last month.</p>
<p class="desc">This measure uses the list of successful installs available on the Marketplace for every registered project. Here is <a href="http://marketplace.eclipse.org/content/eclipse-cdt-cc-development-tooling">an example of log page</a>, metrics tab. If the project is not registered on the Marketplace, the metric should be zero.</p>
</li>
                    </ul>
                  </div>  
                  <div role="tabpanel" class="tab-pane fade" id="repo_PMI"><br />
                    <ul class="list-group">
                      <li class="list-group-item"><p id="PLAN_MILESTONES_VOL"><strong>Number of milestones</strong> ( PLAN_MILESTONES_VOL )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#PLAN_RELEASES">PLAN_RELEASES</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">The number of milestones that occured during the last five releases.</p>
<p class="desc">Milestones are retrieved from the PMI file and are counted whatever their target release is. Milestones are useful to assess the maturity of the release and improves predictability of the project's output, in terms of quality and time.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 1 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 5 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 10 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 20 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                      <li class="list-group-item"><p id="PLAN_NEXT_MILESTONE"><strong>Project is on time for next milestone</strong> ( PLAN_NEXT_MILESTONE )</p>
<p class="desc"><strong>Active</strong>: false</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#PLAN_ON_TIME">PLAN_ON_TIME</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Is the project on time for the next milestone?</p>
</li>
                      <li class="list-group-item"><p id="PLAN_REVIEWS_SUCCESS_RATE"><strong>Reviews success rate</strong> ( PLAN_REVIEWS_SUCCESS_RATE )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#PLAN_RELEASES">PLAN_RELEASES</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">What is the percentage of successful reviews over the past 5 releases?</p>
<p class="desc">The reviews are retrieved from the project management infrastructure record, and are considered successful if the entry is equal to <mark>success</mark>. If there are less than 5 releases defined, the percentage is computed on these only.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 20 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 40 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 60 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 80 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                      <li class="list-group-item"><p id="PUB_ITS_INFO_PMI"><strong>ITS information</strong> ( PUB_ITS_INFO_PMI )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#PUB_ITS_INFO">PUB_ITS_INFO</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Is the bugzilla info correctly filled in the PMI records?</p>
<p class="desc">The project management infrastructure file holds information about one or more bugzilla instances. This test checks that at least one bugzilla instance is defined, with a product identifier, a create_url to enter a new issue, and a query_url to fetch all the issues for the project.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 2 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 3 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 4 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 5 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                      <li class="list-group-item"><p id="PUB_SCM_INFO_PMI"><strong>SCM information</strong> ( PUB_SCM_INFO_PMI )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#PUB_SCM_INFO">PUB_SCM_INFO</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Is the source_repo info correctly filled in the PMI records? </p>
<p class="desc">The project management infrastructure file holds information about one or more source repositories. This test checks that at least one source repository is defined, and accessible.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 1 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 2 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 3 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 4 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                    </ul>
                  </div>  
                  <div role="tabpanel" class="tab-pane fade" id="repo_RuleChecking"><br />
                    <ul class="list-group">
                      <li class="list-group-item"><p id="NCC_ANA_IDX"><strong>Average number of non-conformities for analysability</strong> ( NCC_ANA_IDX )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#PRACTICES_ANA">PRACTICES_ANA</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">The total number of violations of rules that impact analysability in the source code, divided by the number of thousands of lines of code.</p>
<p class="desc">See also the <a href="/documentation/rules.html">page on practices</a> for a list of checked rules and their associated impact on quality characteristics.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &gt; 50 &ge; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &gt; 30 &ge; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &gt; 20 &ge; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &gt; 10 &ge; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                      <li class="list-group-item"><p id="NCC_CHA_IDX"><strong>Average number of non-conformities for changeability</strong> ( NCC_CHA_IDX )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#PRACTICES_CHA">PRACTICES_CHA</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">The total number of violations of rules that impact changeability in the source code, divided by the number of thousands of lines of code.</p>
<p class="desc">See also the <a href="/documentation/rules.html">page on practices</a> for a list of checked rules and their associated impact on quality characteristics.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &gt; 20 &ge; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &gt; 10 &ge; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &gt; 5 &ge; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &gt; 3 &ge; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                      <li class="list-group-item"><p id="NCC_REL_IDX"><strong>Average number of non-conformities for reliability</strong> ( NCC_REL_IDX )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#PRACTICES_REL">PRACTICES_REL</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">The total number of violations of rules that impact reliability in the source code, divided by the number of thousands of lines of code.</p>
<p class="desc">See also the <a href="/documentation/rules.html">page on practices</a> for a list of checked rules and their associated impact on quality characteristics.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &gt; 20 &ge; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &gt; 10 &ge; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &gt; 5 &ge; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &gt; 3 &ge; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                      <li class="list-group-item"><p id="NCC_REU_IDX"><strong>Average number of non-conformities for reusability</strong> ( NCC_REU_IDX )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#PRACTICES_REU">PRACTICES_REU</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">The total number of violations of rules that impact reusability in the source code, divided by the number of thousands of lines of code.</p>
<p class="desc">See also the <a href="/documentation/rules.html">page on practices</a> for a list of checked rules and their associated impact on quality characteristics.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &gt; 300 &ge; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &gt; 200 &ge; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &gt; 150 &ge; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &gt; 100 &ge; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                      <li class="list-group-item"><p id="ROKR_ANA"><strong>Adherence to analysability rules</strong> ( ROKR_ANA )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#PRACTICES_ANA">PRACTICES_ANA</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Ratio of conform analysability practices on the number of checked analysability practices.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 10 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 30 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 50 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 75 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                      <li class="list-group-item"><p id="ROKR_CHA"><strong>Adherence to changeability rules</strong> ( ROKR_CHA )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#PRACTICES_CHA">PRACTICES_CHA</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Ratio of conform changeability practices on the number of checked changeability practices.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 10 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 30 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 50 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 75 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                      <li class="list-group-item"><p id="ROKR_REL"><strong>Adherence to reliability rules</strong> ( ROKR_REL )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#PRACTICES_REL">PRACTICES_REL</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Ratio of conform reliability practices on the number of checked reliability practices.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 10 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 30 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 50 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 75 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                      <li class="list-group-item"><p id="ROKR_REU"><strong>Adherence to reusability rules</strong> ( ROKR_REU )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#PRACTICES_REU">PRACTICES_REU</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Ratio of conform reusability practices on the number of checked reusability practices.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 10 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 30 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 50 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 75 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                    </ul>
                  </div>  
                  <div role="tabpanel" class="tab-pane fade" id="repo_SonarQube"><br />
                    <ul class="list-group">
                      <li class="list-group-item"><p id="ATTRS"><strong>Average number of attributes</strong> ( ATTRS )</p>
<p class="desc"><strong>Active</strong>: false</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#ALL_DATA">ALL_DATA</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Average number of attributes defined in a class. This can be compared to the <a href="/documentation/metrics.html#TOPD">total number of operands</a> (TOPD) considered at the class level, and is representative of the data complexity of the class (not including the complexity of methods).</p>
</li>
                      <li class="list-group-item"><p id="BRANCH_COVERAGE"><strong>Percentage of branches covered by tests</strong> ( BRANCH_COVERAGE )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#TST_COV">TST_COV</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">The percentage of branches that is exercised by the tests. The SonarQube measure used for this purpose is <mark>branch_coverage</mark>.</p>
<p class="desc">On a given line of code, Line coverage simply answers the following question: Has this line of code been executed during the execution of the unit tests?</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 0 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 15 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 36.5 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 73.3 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                      <li class="list-group-item"><p id="COMMENT_LINES_DENSITY"><strong>Comment rate</strong> ( COMMENT_LINES_DENSITY )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#CODE_DOC">CODE_DOC</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">The ratio of source lines of code on the number of comment lines of code.</p>
<p class="desc">Density of comment lines = Comment lines / (Lines of code + Comment lines) * 100. With such a formula, <var>50%</var> means that the number of lines of code equals the number of comment lines and <var>100%</var> means that the file only contains comment lines. The SonarQube measure used for this purpose is <mark>comment_lines_density</mark>. </p>
<p class="desc">See also SonarQube's page on comment lines metrics: <a href="http://docs.sonarqube.org/display/SONAR/Metrics+-+Comment+lines">http://docs.sonarqube.org/display/SONAR/Metrics+-+Comment+lines</a>.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 15.35 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 19.45 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 23.99 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 33.2 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                      <li class="list-group-item"><p id="DUPLICATED_LINES_DENSITY"><strong>Cloning density</strong> ( DUPLICATED_LINES_DENSITY )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#CODE_CLONE">CODE_CLONE</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">The amount of duplicated lines in the code, divided by the number of lines. This is expressed as a percentage; The SonarQube metric used for this purpose is <mark>duplicated_lines_density</mark>.</p>
<p class="desc">See also SonarQube's definition for duplications: <a href="http://docs.sonarqube.org/display/SONAR/Metric+definitions#Metricdefinitions-Duplications">http://docs.sonarqube.org/display/SONAR/Metric+definitions#Metricdefinitions-Duplications</a>. There is a longer description of the code cloning algorithm here: <a href="http://docs.sonarqube.org/display/SONAR/Duplications">http://docs.sonarqube.org/display/SONAR/Duplications</a>.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &gt; 50 &ge; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &gt; 40 &ge; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &gt; 30 &ge; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &gt; 10 &ge; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                      <li class="list-group-item"><p id="FUNCTION_COMPLEXITY"><strong>Average Cyclomatic Complexity</strong> ( FUNCTION_COMPLEXITY )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#CPX">CPX</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">The average number of execution paths found in functions.</p>
<p class="desc">Basically, the counter is incremented every time the control flow of the function splits, with any function having at least a cyclomatic number of 1. The sum of cyclomatic numbers for all functions is then divided by the number of functions. In SonarQube the measure is <code>function_complexity</code>.</p>
<p class="desc">The cyclomatic number is a measure borrowed from graph theory and was introduced to software engineering by McCabe in [<a href="/documentation/references.html">McCabe1976</a>]. It is defined as the number of linearly independent paths that comprise the program. To have good testability and maintainability, McCabe recommends that no program modules (or functions as for Java) should exceed a cyclomatic number of 10. It is primarily defined at the function level and is summed up for higher levels of artefacts.</p>
<p class="desc">See also Wikipedia's entry on cyclomatic complexity: <a href="http://en.wikipedia.org/wiki/Cyclomatic_complexity">http://en.wikipedia.org/wiki/Cyclomatic_complexity</a>.</p>
<p class="desc">See also SonarQube's definition for code complexity: <a href="http://docs.sonarqube.org/display/SONAR/Metrics+-+Complexity">http://docs.sonarqube.org/display/SONAR/Metrics+-+Complexity</a>. There is also a discussion about its meaning here: <a href="http://www.sonarqube.org/discussing-cyclomatic-complexity/">http://www.sonarqube.org/discussing-cyclomatic-complexity/</a></p>
<p class="desc">See also the Maisqual wiki for more details on complexity measures: <a href="http://maisqual.squoring.com/wiki/index.php/Category:Complexity_Metrics">http://maisqual.squoring.com/wiki/index.php/Category:Complexity_Metrics</a>.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &gt; 500 &ge; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &gt; 400 &ge; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &gt; 300 &ge; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &gt; 100 &ge; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                      <li class="list-group-item"><p id="LINE_COVERAGE"><strong>Percentage of lines of code covered by tests</strong> ( LINE_COVERAGE )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#TST_COV">TST_COV</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">The percentage of source lines of code that is exercised by the tests. The SonarQube measure used for this purpose is <mark>line_coverage</mark>.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 0 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 20 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 48.89 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 87.7 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                      <li class="list-group-item"><p id="MDIT"><strong>Depth of Inheritance Tree</strong> ( MDIT )</p>
<p class="desc"><strong>Active</strong>: false</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#CPX">CPX</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">The maximum depth of inheritance tree of a class within the inheritance hierarchy is defined as the maximum length from the considered class to the root of the class hierarchy tree and is measured by the number of ancestor classes. In cases involving multiple inheritance, the MDIT is the maximum length from the node to the root of the tree [<a href="/documentation/references.html#Chidamber1994">Chidamber1994</a>].</p>
<p class="desc">A deep inheritance tree makes the understanding of the object-oriented architecture difficult. Well structured OO systems have a forest of classes rather than one large inheritance lattice. The deeper the class is within the hierarchy, the greater the number of methods it is likely to inherit, making it more complex to predict its behavior and, therefore, more fault-prone [<a href="/documentation/references.html#Chidamber1994">Chidamber1994</a>]. However, the deeper a particular tree is in a class, the greater potential reuse of inherited methods [<a href="/documentation/references.html#Chidamber1994">Chidamber1994</a>].</p>
<p class="desc">See also SonarQube's page on the depth in tree: <a href="http://docs.sonarqube.org/display/SONAR/Metrics+-+Depth+in+Tree">http://docs.sonarqube.org/display/SONAR/Metrics+-+Depth+in+Tree</a></p>
</li>
                      <li class="list-group-item"><p id="METHS"><strong>Average number of methods</strong> ( METHS )</p>
<p class="desc"><strong>Active</strong>: false</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#ALL_DATA">ALL_DATA</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Average number of methods defined in the class. This can be compared to the <a href="/documentation/metrics.html#TOPD">total number of operators</a> (TOPT) considered at the class level.</p>
</li>
                      <li class="list-group-item"><p id="NCLOC"><strong>Source Lines Of Code</strong> ( NCLOC )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#CODE_SIZE">CODE_SIZE</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Number of physical lines that contain at least one character which is neither a whitespace or a tabulation or part of a comment. This is mapped to SonarQube's <mark>ncloc</mark> metric.</p>
<p class="desc">See also SonarQube's definition for size metrics: <a href="http://docs.sonarqube.org/display/SONAR/Metric+definitions#Metricdefinitions-Size">http://docs.sonarqube.org/display/SONAR/Metric+definitions#Metricdefinitions-Size</a>. More details can be seen here: <a href="http://docs.sonarqube.org/display/SONAR/Metrics+-+Lines+of+code">http://docs.sonarqube.org/display/SONAR/Metrics+-+Lines+of+code</a></p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &gt; 915828 &ge; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &gt; 198290.25 &ge; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &gt; 97961.5 &ge; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &gt; 38776.25 &ge; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                      <li class="list-group-item"><p id="PUBLIC_API"><strong>Public API</strong> ( PUBLIC_API )</p>
<p class="desc"><strong>Active</strong>: false</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#PUBLIC_DATA">PUBLIC_DATA</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Number of public Classes + number of public Functions + number of public Properties. The SonarQube measure used for this purpose is <mark>public_api</mark>.</p>
<p class="desc">See also SonarQube's definition for size metrics: <a href="http://docs.sonarqube.org/display/SONAR/Metric+definitions#Metricdefinitions-Size">http://docs.sonarqube.org/display/SONAR/Metric+definitions#Metricdefinitions-Size</a>. More details can be seen here: <a href="http://docs.sonarqube.org/display/SONAR/Metrics+-+Public+API">http://docs.sonarqube.org/display/SONAR/Metrics+-+Public+API</a></p>
</li>
                      <li class="list-group-item"><p id="TEST_SUCCESS_DENSITY"><strong>Test success density</strong> ( TEST_SUCCESS_DENSITY )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#TST_SUCCESS">TST_SUCCESS</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">The percentage of failed tests during the last execution of the test plan. The SonarQube measure used for this purpose is <mark>test_success_density</mark>.</p>
<p class="desc">Computation is as follows: Test success density = (Unit tests - (Unit test errors + Unit test failures)) / Unit tests * 100, where Unit test errors is the number of unit tests that have failed, Unit test failures is the number of unit tests that have failed with an unexpected exception.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 50 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 65 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 80 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 95 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                      <li class="list-group-item"><p id="TST_VOL_IDX"><strong>Number of tests relative to the code size</strong> ( TST_VOL_IDX )</p>
<p class="desc"><strong>Active</strong>: true</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#TST_VOL">TST_VOL</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">The total number of test cases for the product, divided by the number of thousands of SLOC.</p>
<p class="desc">Metric is computed from SonarQube <mark>tests</mark> and <mark>ncloc</mark> metrics.</p>
<p class="desc"><strong>Scale</strong>: <span class="label label-scale" style="background-color: #FFFF66"> 1 </span> &lt; 2 &le; <span class="label label-scale" style="background-color: #CCF24D;"> 2  </span> &lt; 5 &le; <span class="label label-scale" style="background-color: #99E633;"> 3  </span> &lt; 7 &le; <span class="label label-scale" style="background-color: #66D91A;"> 4  </span> &lt; 10 &le; <span class="label label-scale" style="background-color: #33CC00;"> 5 </span></p>
</li>
                    </ul>
                  </div>  
                  <div role="tabpanel" class="tab-pane fade" id="repo_Unknown"><br />
                    <ul class="list-group">
                      <li class="list-group-item"><p id="DL_REPO_1M"><strong>Number of downloads on the web site</strong> ( DL_REPO_1M )</p>
<p class="desc"><strong>Active</strong>: false</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#DOWNLOADS">DOWNLOADS</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">The number of downloads on the web site of the project (download page) during last month. Example of download page (for CDT) : http://www.eclipse.org/downloads/ .</p>
</li>
                      <li class="list-group-item"><p id="DL_UPDATE_SITE_1M"><strong>Number of downloads on update site</strong> ( DL_UPDATE_SITE_1M )</p>
<p class="desc"><strong>Active</strong>: false</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#DOWNLOADS">DOWNLOADS</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">The number of downloads on the update site of the project during last month. Is computed using successful and failed installs from marketplace.</p>
</li>
                      <li class="list-group-item"><p id="IP_LOG_COV"><strong>IP log code coverage</strong> ( IP_LOG_COV )</p>
<p class="desc"><strong>Active</strong>: false</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#IP_LOG">IP_LOG</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Percentage of contributions covered by an appropriate IP log.</p>
<p class="desc">Eclipse foundation has a very strict <a href="https://www.eclipse.org/org/documents/Eclipse_IP_Policy.pdf">IP policy</a> and this measure should always be 100%.</p>
</li>
                      <li class="list-group-item"><p id="LIC_IDENT"><strong>License identification</strong> ( LIC_IDENT )</p>
<p class="desc"><strong>Active</strong>: false</p>
<p class="desc"><strong>Used by</strong>: <a href="questions.html#LIC">LIC</a>
</p>
<p class="desc"><strong>Description</strong>:</p>
<p class="desc">Is there a list of the different licences used in the product?</p>
<p class="desc">This measure may use an external tool like Ninka (<a href="http://ninka.turingmachine.org/">ninka.turingmachine.org</a>) to identify the licence of components used in the project. Another way would be to identify a file named LICENCES in the root folder.</p>
</li>
                    </ul>
                  </div>  
              </div>
            </div>
          </div>
        </div>