godns Cookbook
================

Install godns monitoring tool

Requirements
------------

### Platforms

### Chef

### Cookbooks

None, this is Go !

Attributes
----------

e.g.
#### godns::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['godns']['download_url']</tt></td>
    <td>string</td>
    <td>Download URL of binary archive</td>
    <td><tt>https://github.com/Scalingo/godns/releases/download/</tt></td>
  </tr>
  <tr>
    <td><tt>['godns']['version']</tt></td>
    <td>string</td>
    <td>Version of the executable</td>
    <td><tt>v1.7.3</tt></td>
  </tr>
  <tr>
    <td><tt>['godns']['arch']</tt></td>
    <td>string</td>
    <td>Target architecture</td>
    <td><tt>amd64</tt></td>
  </tr>
</table>

See https://github.com/Scalingo/godns-cookbook/blob/master/attributes/default.rb for details

Usage
-----
#### godns::default

Just include `godns` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[godns]"
  ]
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Léo Unbekandt `leo@unbekandt.eu`
