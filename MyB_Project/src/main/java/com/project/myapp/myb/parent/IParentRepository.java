package com.project.myapp.myb.parent;

public interface IParentRepository {
	void insertParent(ParentVO parent);
	ParentVO selectParent(String parentEmail);
}
