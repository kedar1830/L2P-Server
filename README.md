<style type="text/css" media="all">

  img{
    width: 50%;
    height: 50%;
  }
  
  table{
    background: white;
    text-align: center;
  }
  
  
  th{
    background-color: rgb(240,240,240);
  }
  
  td{
    background-color: rgb(240,240,240);
  }
  
</style>

<h1>L2P-Server <mark>(LocalHost to Public Server)</mark> </h1>
It is advanced Server of Version Simple-Server which is in my page.
<p>
 This L2P-Server project is a modified version of Simple-Server project which is in my github page. On Simple-Server is only for LocalHosting you can't use it globaly but This L2P-Server you are able to use it from any where but not that if you wana use it full version then you have to get premiumship of NGROK other wise you can use it free version also but on free version they will provide random domain name for your project and if you upgrade it to premium then you able to add your name on it.
</p>

<pre>
EX:- (Free  version) https://ienejwjwnw-hebeheb-nwbsh.ngrok-free.app
    (Upgraded version) xyz-zyx.ngrok-free.app
</pre>

<h1> Installation Proccess:- </h1>
<table border="3">
  
  <tr>
    <td>clone</td>
    <td>git clone https://github.com/kedar1830/L2P-Server.git</td>
  </tr>
  
  <tr>
    <td>Change Directory</td>
    <td>cd L2P-Server</td>
  </tr>
  
  <tr>
    <td>Installation</td>
    <td>bash install.sh</td>
  </tr>
  
  <tr>
    <td>Test</td>
    <td>server</td>
  </tr>

</table>

<h1>Requirements:-</h1>

<ol>
<li>NGROK account:-</li>
<img src="/page.jpg" alt="Ngrok homepage">

<li>NGROK authentication token:-</li>
<img src="/auth_token.jpg" alt="auth_token">

<li>NGROK static domain name:-</li>
<img src="/domain_name.jpg" alt="domain_name">

</ol>

<h1>Code will ask you for this:-</h1>

<ul>
<li>your Ngrok doamin name</li>
<li>your port/ default(3000) </li>
<li>your auth token</li>
</ul>

<p>This tool will ask you about this 3 things after that your code will run successfuly.</p>


<h1>Which Changes/edits You can do?:-</h1>
<ol>
  <li>Your able to change directories</li>
  <li>Your able to edit index.html</li>
  <details>
    <summary>
      Frontend Files Location
    </summary>
    <mark>/storage/emulated/0/termux/Server/public/index.html</mark>
  </details>
  <li>If you stayed default directories then you are able to edit all files in any external apps like:- Acode,htmleditor etc</li>
</ol>

<h1>Root file, Tunneling file and Master file Locations:-</h1>

<table border="3">
  <tr>
    <th>Files</th>
    <th>Directories/Location</th>
  </tr>
  
  <tr>
    <tr>
      <td>Lstart(LocalHost Server)</td>
      <td>$PREFIX/bin/Lstart</td>
    </tr>
  </tr>
  <tr>
    <tr>
      <td>Pstart(Public Server)</td>
      <td>$PREFIX/bin/Pstart</td>
    </tr>
  </tr>
  <tr>
    <tr>
      <td>server(L2P server)</td>
      <td>$PREFIX/bin/server</td>
    </tr>
  </tr>
  
</table>

