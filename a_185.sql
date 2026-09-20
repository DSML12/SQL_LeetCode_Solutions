--------------------------------------
-- 185. Department Top Three Salaries
--------------------------------------

With ranks As (
    Select name, salary, departmentId,
        Dense_Rank() Over(Partition by departmentId Order by salary DESC) as rnk
    From Employee),

top_3_ranks As (
    Select name, salary, departmentId, rnk
    From ranks
    Where rnk < 4
)

Select d.name as Department, t.name as Employee, t.salary
From top_3_ranks t 
Inner Join Department d
on t.departmentId = d.id
