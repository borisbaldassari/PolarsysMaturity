
              <h2>Definition of Attributes</h2>
              <p>Attributes of quality represent our measurement goals for the given context. The first step when defining attributes is to gather quality requirements, in this case both for the Eclipse foundation and the PolarSys working group. These have been summarised <a href="https://polarsys.org/wiki/EclipseQualityRequirements">on a dedicated page of the wiki</a>. We relied on different standards and norms to formalise them: ISO 9126 and 250xx for the product, CMMi for the process, and open-source quality models for the community. </p><br />
        

              <ul class="list-group">
                <li class="list-group-item"><p id="QM_ACTIVITY"><strong>Activity</strong> ( QM_ACTIVITY )</p>
<p class="desc">The activity of the project's ecosystem, as measured on the mailing lists and configuration management system.</p>
<p class="desc">An active project will provide a lot of information on the mailing lists, so when an user encounters an issue she will quickly find the information she needs, and has more chances to get answers if she asks. Fixes and improvements are added regularly.</p>

                </li>
                <li class="list-group-item"><p id="QM_ANA"><strong>Analysability</strong> ( QM_ANA )</p>
<p class="desc">Degree of effectiveness and efficiency with which it is possible to assess the impact on a product or system of an intended change to one or more of its parts, or to diagnose a product for deficiencies or causes of failures, or to identify parts to be modified. (ISO/IEC 25010)</p>

                </li>
                <li class="list-group-item"><p id="QM_CHA"><strong>Changeability</strong> ( QM_CHA )</p>
<p class="desc">Degree to which a product or system can be effectively and efficiently modified without introducing defects or degrading existing product quality. (ISO/IEC 25010)</p>

                </li>
                <li class="list-group-item"><p id="QM_DIVERSITY"><strong>Diversity</strong> ( QM_DIVERSITY )</p>
<p class="desc">The diversity of the project's ecosystem, as measured on the mailing lists and configuration management system.</p>
<p class="desc">If many different actors from different companies are involved in the project, then it improves its sustainability (by eliminating a single point of failure) and adaptability to different situations. Having developers and users with different contexts and perspectives on the project helps widening its scope and provide a more generic support.</p>

                </li>
                <li class="list-group-item"><p id="QM_ECOSYSTEM"><strong>Ecosystem</strong> ( QM_ECOSYSTEM )</p>
<p class="desc">The sustainability of the ecosystem evolving around the project.</p>
<p class="desc">Sustainability is a key point for long term support. If there is a lot of activity, if people can get fast and complete answers, if many people from different companies contribute to the project, then it will have more chance to still be there in a few years, and to continue providing fixes and improvements.</p>
<p class="desc">Ecosystem requirements have been discussed on the mailing list and during meetings, and have been further described on the <a href="https://polarsys.org/wiki/EclipseQualityRequirements#Identified_Requirements_for_Community">Polarsys wiki</a>.</p>

                </li>
                <li class="list-group-item"><p id="QM_FEEDBACK"><strong>User feedback</strong> ( QM_FEEDBACK )</p>
<p class="desc">How do the users of the software evaluate the project and product?</p>

                </li>
                <li class="list-group-item"><p id="QM_IP"><strong>Intellectual Property Management</strong> ( QM_IP )</p>
<p class="desc">How is intellectual property handled in the project? Is there an IP log? Are the project and the Eclipse Foundation safe regarding IP?</p>

                </li>
                <li class="list-group-item"><p id="QM_ITS"><strong>Change Management</strong> ( QM_ITS )</p>
<p class="desc">Do the project applies best practices regarding change management?</p>

                </li>
                <li class="list-group-item"><p id="QM_PLAN"><strong>Planning Management</strong> ( QM_PLAN )</p>
<p class="desc">Is the project behaviour predicable? Are outputs delivered on planned time and quality?</p>

                </li>
                <li class="list-group-item"><p id="QM_PROCESS"><strong>Process</strong> ( QM_PROCESS )</p>
<p class="desc">The maturity of the process used to run the project.</p>
<p class="desc">A sound process helps people to do things right and ease collaborative work. If the process is documented, has predictable output, helps enforcing good development practices, etc. then new comers will easily find the information to collaborate, test or change code, or participate in the community. A good process also helps producing a good product [< href="/documentation/references.html#Ing2003">Ing2003</a>] -- although it is agreed that the process is not enough by itself.</p>
<p class="desc">Process requirements have been discussed on the mailing list and during meetings, and have been further described on the <a href="https://polarsys.org/wiki/EclipseQualityRequirements#Identified_Requirements_for_Process">Polarsys wiki</a>. Some may also recognise CMMi Key Process Areas among the attributes.</p>

                </li>
                <li class="list-group-item"><p id="QM_PRODUCT"><strong>Product</strong> ( QM_PRODUCT )</p>
<p class="desc">The quality of the product delivered by the project, i.e. the source code, binaries, tests.</p>
<p class="desc">Product quality is mainly focused on maintainability for long-term support, through analysability, changeability, and reusability. Reliability is also considered for a bug may have a great impact when encountered by large teams.</p>
<p class="desc">Product requirements have been discussed on the mailing list and during meetings, and have been further described on the <a href="https://polarsys.org/wiki/EclipseQualityRequirements#Identified_Requirements_for_Product">Polarsys wiki</a>. Some may also recognise attributes borrowed from the [<a href="/documentation/references.html#ISO9126">ISO 9126</a>] and [<a href="/documentation/references.html#ISO250xx">ISO 250xx SQuaRE</a>] standards.</p>

                </li>
                <li class="list-group-item"><p id="QM_QUALITY"><strong>Project Maturity</strong> ( QM_QUALITY )</p>
<p class="desc">The overall Maturity of the project.</p>
<p class="desc">In the context of embedded software, Maturity is usually associated with some kind of reliability (most bugs have been already found) and functionality of code, sustainability of the project (will it still deliver fixes and improvements in a few years), and process predictability. Maturity in the PolarSys context has been further described <a href="https://polarsys.org/wiki/MaturityDefinition">on the wiki</a>, and is actually precisely defined by the decomposition of this quality model.</p>

                </li>
                <li class="list-group-item"><p id="QM_REL"><strong>Reliability</strong> ( QM_REL )</p>
<p class="desc">Degree to which a system, product or component performs specified functions under specified conditions for a specified period of time. (ISO/IEC 25010)</p>

                </li>
                <li class="list-group-item"><p id="QM_RESPONSIVENESS"><strong>Responsiveness</strong> ( QM_RESPONSIVENESS )</p>
<p class="desc">How fast people get an answer when they ask for help about the project.</p>
<p class="desc">Having fast answers on the mailing lists encourages users better test and use the product, and allows developers to develop more efficiently, thus encreasing the collaboration of new comers. It also gives a good impression of the project.</p>

                </li>
                <li class="list-group-item"><p id="QM_REU"><strong>Reusability</strong> ( QM_REU )</p>
<p class="desc">Degree to which an asset can be used in more than one system, or in building other assets. (ISO/IEC 25010)</p>

                </li>
                <li class="list-group-item"><p id="QM_SCM"><strong>Configuration Management</strong> ( QM_SCM )</p>
<p class="desc">The maturity of the project regarding access and usage of the configuration management system.</p>
<p class="desc">Configuration management is an essential part of the collaboration in the project. Access to the source should be documented and facilitated for new comers to easily come in.</p>

                </li>
                <li class="list-group-item"><p id="QM_SUPPORT"><strong>Support</strong> ( QM_SUPPORT )</p>
<p class="desc">The amount of knowledge provided when someone asks for support.</p>
<p class="desc">Having many answers on a single question helps better understand how the product works in different conditions, and also provides help for people looking for a similar information later on, since mailing lists are archived and public.</p>

                </li>
                <li class="list-group-item"><p id="QM_TST"><strong>Test Management</strong> ( QM_TST )</p>
<p class="desc">Is the product thoroughly tested? How many tests are there, what is the code coverage?</p>

                </li>
                <li class="list-group-item"><p id="QM_USAGE"><strong>Usage</strong> ( QM_USAGE )</p>
<p class="desc">The degree of usage of the project: is it widely used, by different people in different context?</p>

                </li>
                <li class="list-group-item"><p id="QM_VISIBILITY"><strong>Visibility</strong> ( QM_VISIBILITY )</p>
<p class="desc">How much the project is visible for people not involved in it.</p>
<p class="desc">If someone has a need fulfilled by the product, she has to know about the project in order to use it. Making the project visible helps people find it when they need it, through blogs, research or journal articles, conferences, or marketing. It also helps the project gather people willing to contribute and test it.</p>

                </li>
              </ul>