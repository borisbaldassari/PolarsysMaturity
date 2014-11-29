
        <div id="page-wrapper">
          <div class="row">
            <div class="col-lg-12">

              <h3>Scales &gt; PMI</h3>

              <p>The <a href="http://marketplace.eclipse.org/">Eclipse marketplace</a> lists the products and companies that make the Eclipse ecosystem. Users can also directly install plugins from the marketplace into their own IDE by a single drag'n'drop. To setup the scales, we selected a set of 15 projects and applied the set of metrics to them. </p>
              
              <ul class="list-group">
                <li class="list-group-item"><a href="https://marketplace.eclipse.org/content/android-development-tools-eclipse">Android Development Tools</a></li>
                <li class="list-group-item"><a href="https://marketplace.eclipse.org/content/arcon-architecture-conformance-validation-tool">ArCon architecture conformance validation tool</a></li>
                <li class="list-group-item"><a href="https://marketplace.eclipse.org/content/eclipse-cdt-cc-development-tooling">CDT</p></li>
                <li class="list-group-item"><a href="https://marketplace.eclipse.org/content/checkstyle-plug">CheckStyle plugin</p></li>
                <li class="list-group-item"><a href="https://marketplace.eclipse.org/content/eclemma-java-code-coverage">EclEmma Java code coverage</p></li>
                <li class="list-group-item"><a href="https://marketplace.eclipse.org/content/findbugs-eclipse-plugin">FindBugs plugin</p></li>
                <li class="list-group-item"><a href="https://marketplace.eclipse.org/content/gendoc2">Gendoc2</p></li>
              </ul>

              <p>If an analysed project is not registered on the Marketplace, all values are supposed to be null (zeros).</p>
              
              <div class="media">
                <a class="media-left" href="/images/percentage_of_release_reviews_marked_as_successful_for_eclipse_projects.svg">
                  <img width="256px" src="/images/percentage_of_release_reviews_marked_as_successful_for_eclipse_projects.svg"  class="img-responsive" alt="percentage_of_release_reviews_marked_as_successful_for_eclipse_projects" />
                </a>
                <div class="media-body">
                  <h4 class="media-heading">Media heading</h4>
                  <p>This plot shows </p>
                </div>
              </div>

              <p>The initial set of thresholds for metrics in Grimoire is the following:</p>

              <ul class="list-group">
                <li class="list-group-item">
                  <a href="metrics.html#MKT_FAV"><strong>Number of commits</strong></a> (SCM_COMMITS_1M)<br />
                  [0.025078279624, 0.0756446929809, 0.264255236791, 2.54688585321]
                </li>
                <li class="list-group-item">
                  <a href="metrics.html#MKT_"><strong>Number of committers</strong></a> (SCM_COMMITTERS_1M)<br />
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
