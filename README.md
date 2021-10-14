<h1>Binary Search Tree using Ruby</h1>

<p>This is an implementation of a binary search tree. A Node and a Tree class were created to hold the components and methods of the tree.</p>

<h2>Methods</h2>
<table>
    <tr>
        <th>Method</th>
        <th>Description</th>
    </tr>
    <tr>
        <td>#build_tree</td>
        <td>Given an array, return a balanced binary search tree filled with Nodes.</td>
    </tr>
    <tr>
        <td>#insert</td>
        <td>Given a value, add a new leaf node to the tree.</td>
    </tr>
    <tr>
        <td>#delete</td>
        <td>Given a value, delete the node from the tree if the value exists. There are two deletion scenarios to account for, 1) the node has one or zero child nodes; 2) the node has two child nodes</td>
    </tr>
    <tr>
        <td>#find</td>
        <td>Given a value, return the node with the given value if it exists.</td>
    </tr>
    <tr>
        <td>#level_order</td>
        <td>Return an array with the values of the tree traversed in breadth-first level order.</td>
    </tr>
    <tr>
        <td>#inorder</td>
        <td>Return an array with the values of the tree traversed depth-first in order.</td>
    </tr>
    <tr>
        <td>#preorder</td>
        <td>Return an array with the values of the tree traversed depth-first preorder.</td>
    </tr>
    <tr>
        <td>#postorder</td>
        <td>Return an array with the values of the tree traversed depth-first postorder.</td>
    </tr>
    <tr>
        <td>#height</td>
        <td>Given a node, return the number of branches between the node and its furthest child node.</td>
    </tr>
    <tr>
        <td>#depth</td>
        <td>Given a node, return the number of branches between the node and the root node.</td>
    </tr>
    <tr>
        <td>#balanced?</td>
        <td>Return whether or not the tree is balanced.</td>
    </tr>
    <tr>
        <td>#rebalance</td>
        <td>Rebalance the tree.</td>
    </tr>
</table>
