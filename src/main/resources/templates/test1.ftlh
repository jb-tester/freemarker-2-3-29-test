<#-- @ftlvariable name="persons" type="java.util.List<com.mytests.freemarker.freemarker2329test.Person>" -->
<#-- @ftlvariable name="persons_array" type="com.mytests.freemarker.freemarker2329test.Person[]" -->

<h1>check built-ins intoriduced in FM 2.3.29</h1>
<#assign numbers = [11, -2.7, 3.1, 44, -5, -2.5,6,-7]>
<#assign ints = numbers?map(x -> x?round)>
<#assign foo = [15]>
<#assign bar = ['1234567',  '891234567']>
<#assign str = 'rather long string with few words'>
${str?truncate(20)}
<br/>
${str?truncate_w(20)}
<br/>
${str?truncate_c(20)}
<br/>
${str?truncate_w(10,'***',0)}
<br/>
<#list bar?map(b -> b?truncate(8)) as b> truncated element:${bar[b?index]} ${b} <br/> </#list>
<p>Positives:</p>
<#list ints?drop_while(z -> z == 4)?filter(x -> x > 0) as x>${x} </#list>
<p>Negatives:</p>
<#list ints?filter(element -> (element < 0) && (element != -2)) as xxx>${xxx} </#list>
<p>exp</p>
<#list ints?map((i) -> (100)) as xxx>${xxx} </#list>


<p>************sequence of pojo*******************</p>
<#assign personsSeq = [mother, father]>
<#list personsSeq?filter(person -> person.unemployed && person.age>18) as p> ${p.name} </#list>
<p>************list of pojo*******************</p>
<#list persons?filter(p -> p.unemployed && p.age>18) as p> ${p.name} </#list>
<p>*************array of pojo*******************</p>
<#list persons_array?map(pa -> pa.name) as pa> ${pa} </#list>
<p>************flux of pojos should show error********************</p>
<#--<#list persons_flux?map(pf -> pf.name) as pf> ${pf} </#list>-->


 <p>Check model attributes of array type resolving</p>
${attr1[1].name}
${persons_array[1].name}
