godns Cookbook
================

Install godns monitoring tool

Requirements
------------

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
    <td><tt>['godns']['version']</tt></td>
    <td>string</td>
    <td>Version of the executable</td>
    <tdL><tt>v1.1</tt></td>
  </tr>
</table>

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
