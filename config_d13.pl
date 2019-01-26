ex00 -N -f1=btree_create_node.c -f2=ft_btree.h

lol hi
main -f=btree_create_node.c ====
#include "ft_btree.h"

t_btree		*btree_create_node(void *item);

int main()
{
	t_btree* node = btree_create_node("asdf");
	printf("%s\n", (char*)node->item);
	printf("%p\n", node->left);
	printf("%p\n", node->right);
}
==== check -e ====
$expected = "asdf\n0x0\n0x0\n";
====

ex01 -N -f1=btree_apply_prefix.c -f2=ft_btree.h

lol hi
main -f=btree_apply_prefix.c ====
#include "ft_btree.h"
#include <string.h>
#include <stdio.h>

void	btree_apply_prefix(t_btree *root, void (applyf)(void *));

t_btree		*bcn(void *item)
{
	t_btree *node;

	node = malloc(sizeof(t_btree));
	node->item = item;
	node->left = 0;
	node->right = 0;
	return (node);
}

void	b_in(t_btree **root, void *item, int (*cmpf)(void *, void *))
{
	t_btree **node_it;

	if(*root)
	{
		node_it = root;
		while (*node_it) {
			if (cmpf(item, (*node_it)->item) >= 0)
				node_it = &((*node_it)->right);
			else
				node_it = &((*node_it)->left);
		}
		*node_it = bcn(item);
	}
	else
	{
		*root = bcn(item);
	}
}

int main()
{
	t_btree* root = 0;

	btree_apply_prefix(root, (void(*)(void *))printf);
	printf("\n");
	b_in(&root, "6", (int(*)(void *, void *))strcmp);
	b_in(&root, "4", (int(*)(void *, void *))strcmp);
	b_in(&root, "7", (int(*)(void *, void *))strcmp);
	b_in(&root, "3", (int(*)(void *, void *))strcmp);
	b_in(&root, "5", (int(*)(void *, void *))strcmp);

	btree_apply_prefix(root, (void(*)(void *))printf);
}
==== check -e ====
$expected = "\n64357";
====

ex02 -N -f1=btree_apply_infix.c -f2=ft_btree.h

lol hi
main -f=btree_apply_infix.c ====
#include "ft_btree.h"
#include <string.h>
#include <stdio.h>
#
void	btree_apply_infix(t_btree *root, void (applyf)(void *));

t_btree		*bcn(void *item)
{
	t_btree *node;

	node = malloc(sizeof(t_btree));
	node->item = item;
	node->left = 0;
	node->right = 0;
	return (node);
}

void	b_in(t_btree **root, void *item, int (*cmpf)(void *, void *))
{
	t_btree **node_it;

	if(*root)
	{
		node_it = root;
		while (*node_it) {
			if (cmpf(item, (*node_it)->item) >= 0)
				node_it = &((*node_it)->right);
			else
				node_it = &((*node_it)->left);
		}
		*node_it = bcn(item);
	}
	else
	{
		*root = bcn(item);
	}
}

int main()
{
	t_btree* root = 0;

	btree_apply_infix(root, (void(*)(void *))printf);
	printf("\n");
	b_in(&root, "6", (int(*)(void *, void *))strcmp);
	b_in(&root, "4", (int(*)(void *, void *))strcmp);
	b_in(&root, "7", (int(*)(void *, void *))strcmp);
	b_in(&root, "3", (int(*)(void *, void *))strcmp);
	b_in(&root, "5", (int(*)(void *, void *))strcmp);

	btree_apply_infix(root, (void(*)(void *))printf);
}
==== check -e ====
$expected = "\n34567";
====

ex03 -N -f1=btree_apply_suffix.c -f2=ft_btree.h

lol hi
main -f=btree_apply_suffix.c ====
#include "ft_btree.h"
#include <string.h>
#include <stdio.h>

void	btree_apply_suffix(t_btree *root, void (*applyf)(void *));

t_btree		*bcn(void *item)
{
	t_btree *node;

	node = malloc(sizeof(t_btree));
	node->item = item;
	node->left = 0;
	node->right = 0;
	return (node);
}

void	b_in(t_btree **root, void *item, int (*cmpf)(void *, void *))
{
	t_btree **node_it;

	if(*root)
	{
		node_it = root;
		while (*node_it) {
			if (cmpf(item, (*node_it)->item) >= 0)
				node_it = &((*node_it)->right);
			else
				node_it = &((*node_it)->left);
		}
		*node_it = bcn(item);
	}
	else
	{
		*root = bcn(item);
	}
}

int main()
{
	t_btree* root = 0;

	btree_apply_suffix(root, (void(*)(void *))printf);
	printf("\n");
	b_in(&root, "6", (int(*)(void *, void *))strcmp);
	b_in(&root, "4", (int(*)(void *, void *))strcmp);
	b_in(&root, "7", (int(*)(void *, void *))strcmp);
	b_in(&root, "3", (int(*)(void *, void *))strcmp);
	b_in(&root, "5", (int(*)(void *, void *))strcmp);

	btree_apply_suffix(root, (void(*)(void *))printf);
}
==== check -e ====
$expected = "\n35476";
====

ex04 -N -f1=btree_insert_data.c -f2=ft_btree.h

lol hi
main -f=btree_insert_data.c ====
#include "ft_btree.h"
#include <string.h>
#include <stdio.h>

void	btree_insert_data(t_btree **root, void *item, int (*cmpf)(void *, void *));

void	bai(t_btree *root, void (*applyf)(void *))
{
	if (root)
	{
		bai(root->left, applyf);
		applyf(root->item);
		bai(root->right, applyf);
	}
}

t_btree		*btree_create_node(void *item)
{
	t_btree *node;

	node = malloc(sizeof(t_btree));
	node->item = item;
	node->left = 0;
	node->right = 0;
	return (node);
}

int main()
{
	t_btree* root = 0;

	btree_insert_data(&root, "6", (int(*)(void *, void *))strcmp);
	btree_insert_data(&root, "4", (int(*)(void *, void *))strcmp);
	btree_insert_data(&root, "7", (int(*)(void *, void *))strcmp);
	btree_insert_data(&root, "3", (int(*)(void *, void *))strcmp);
	btree_insert_data(&root, "5", (int(*)(void *, void *))strcmp);

	bai(root, (void(*)(void *))printf);
}
==== check -e ====
$expected = "34567";
====

ex05 -N -f1=btree_search_item.c -f2=ft_btree.h

lol hi
main -f=btree_search_item.c ====
#include "ft_btree.h"
#include <string.h>
#include <stdio.h>

void	*btree_search_item(t_btree *root, void *data_ref, int (*cmpf)(void *, void *));

void	bai(t_btree *root, void (*applyf)(void *))
{
	if (root)
	{
		bai(root->left, applyf);
		applyf(root->item);
		bai(root->right, applyf);
	}
}

t_btree		*bcn(void *item)
{
	t_btree *node;

	node = malloc(sizeof(t_btree));
	node->item = item;
	node->left = 0;
	node->right = 0;
	return (node);
}


void	b_in(t_btree **root, void *item, int (*cmpf)(void *, void *))
{
	t_btree **node_it;

	if(*root)
	{
		node_it = root;
		while (*node_it) {
			if (cmpf(item, (*node_it)->item) >= 0)
				node_it = &((*node_it)->right);
			else
				node_it = &((*node_it)->left);
		}
		*node_it = bcn(item);
	}
	else
	{
		*root = bcn(item);
	}
}


int main()
{
	t_btree* root = 0;

	b_in(&root, "6", (int(*)(void *, void *))strcmp);
	b_in(&root, "4", (int(*)(void *, void *))strcmp);
	b_in(&root, "7", (int(*)(void *, void *))strcmp);
	b_in(&root, "3", (int(*)(void *, void *))strcmp);
	b_in(&root, "5", (int(*)(void *, void *))strcmp);

	printf("%s\n", btree_search_item(root, "3", (int(*)(void *, void *))strcmp));
	printf("%s\n", btree_search_item(root, "1", (int(*)(void *, void *))strcmp));
	printf("%s\n", btree_search_item(root, "5", (int(*)(void *, void *))strcmp));
}
==== check -e ====
$expected = "3\n(null)\n5\n";
====

ex06 -N -f1=btree_level_count.c -f2=ft_btree.h

lol hi
main -f=btree_level_count.c ====
#include "ft_btree.h"
#include <string.h>
#include <stdio.h>

int		btree_level_count(t_btree *root);

void	bai(t_btree *root, void (*applyf)(void *))
{
	if (root)
	{
		bai(root->left, applyf);
		applyf(root->item);
		bai(root->right, applyf);
	}
}

t_btree		*bcn(void *item)
{
	t_btree *node;

	node = malloc(sizeof(t_btree));
	node->item = item;
	node->left = 0;
	node->right = 0;
	return (node);
}


void	b_in(t_btree **root, void *item, int (*cmpf)(void *, void *))
{
	t_btree **node_it;

	if(*root)
	{
		node_it = root;
		while (*node_it) {
			if (cmpf(item, (*node_it)->item) >= 0)
				node_it = &((*node_it)->right);
			else
				node_it = &((*node_it)->left);
		}
		*node_it = bcn(item);
	}
	else
	{
		*root = bcn(item);
	}
}


int main()
{
	t_btree* root = 0;

	printf("%d\n", btree_level_count(root));
	b_in(&root, "6", (int(*)(void *, void *))strcmp);
	b_in(&root, "4", (int(*)(void *, void *))strcmp);
	b_in(&root, "7", (int(*)(void *, void *))strcmp);
	b_in(&root, "3", (int(*)(void *, void *))strcmp);
	b_in(&root, "5", (int(*)(void *, void *))strcmp);
	printf("%d\n", btree_level_count(root));
	b_in(&root, "2", (int(*)(void *, void *))strcmp);
	printf("%d\n", btree_level_count(root));
}
==== check -e ====
$expected = "0\n3\n4\n";
====
