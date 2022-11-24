// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";
import * as Belt_Array from "rescript/lib/es6/belt_Array.js";
import * as Fa from "react-icons/fa";

var initialState_todoList = [];

var initialState = {
  todoList: initialState_todoList,
  inputValue: ""
};

function reducer(state, action) {
  if (typeof action === "number") {
    if (action === /* AddTodo */0) {
      return {
              todoList: state.todoList.concat([{
                      title: state.inputValue,
                      isDone: false
                    }]),
              inputValue: ""
            };
    } else {
      return {
              todoList: [],
              inputValue: state.inputValue
            };
    }
  }
  if (action.TAG === /* InputChanged */0) {
    return {
            todoList: state.todoList,
            inputValue: action._0
          };
  }
  var index = action._0;
  return {
          todoList: Belt_Array.mapWithIndex(state.todoList, (function (i, todo) {
                  if (i === index) {
                    return {
                            title: todo.title,
                            isDone: !todo.isDone
                          };
                  } else {
                    return todo;
                  }
                })),
          inputValue: state.inputValue
        };
}

var FaPlusCircle = {};

var FaTrash = {};

function Todos$default(Props) {
  var match = React.useReducer(reducer, initialState);
  var dispatch = match[1];
  var state = match[0];
  var handleInput = function (e) {
    var newValue = e.target.value;
    Curry._1(dispatch, {
          TAG: /* InputChanged */0,
          _0: newValue
        });
  };
  return React.createElement("div", {
              className: "container"
            }, React.createElement("div", {
                  className: "inner"
                }, React.createElement("div", {
                      className: "header",
                      style: {
                        color: "#ececec",
                        fontSize: "6rem",
                        fontWeight: "600",
                        lineHeight: "1em",
                        marginBottom: "2rem",
                        textAlign: "center",
                        textTransform: "lowercase"
                      }
                    }, "todos"), React.createElement("form", {
                      className: "form-container"
                    }, React.createElement("input", {
                          className: "input-text",
                          placeholder: "Add todo...",
                          type: "text",
                          value: state.inputValue,
                          onChange: handleInput
                        })), React.createElement("button", {
                      className: "input-submit",
                      onClick: (function (param) {
                          Curry._1(dispatch, /* AddTodo */0);
                        })
                    }, React.createElement(Fa.FaPlusCircle, {})), React.createElement("ul", {
                      className: "todoslist"
                    }, Belt_Array.mapWithIndex(state.todoList, (function (i, todo) {
                            return React.createElement("li", {
                                        key: todo.title,
                                        className: "item",
                                        style: {
                                          color: todo.isDone ? "#595959" : "black",
                                          fontStyle: todo.isDone ? "italic" : "bold",
                                          padding: "1rem",
                                          textDecoration: todo.isDone ? "line-through" : "initial",
                                          opacity: todo.isDone ? "0.4" : "1"
                                        },
                                        onClick: (function (param) {
                                            Curry._1(dispatch, {
                                                  TAG: /* MarkDone */1,
                                                  _0: i
                                                });
                                          })
                                      }, todo.title, React.createElement("button", {
                                            onClick: (function (param) {
                                                Curry._1(dispatch, /* ClearTodos */1);
                                              })
                                          }, React.createElement(Fa.FaTrash, {})));
                          })))));
}

var $$default = Todos$default;

export {
  initialState ,
  reducer ,
  FaPlusCircle ,
  FaTrash ,
  $$default ,
  $$default as default,
}
/* react Not a pure module */