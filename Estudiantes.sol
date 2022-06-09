// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Estudiante
{
    string private _nombre;
    string private _apellido;
    string private _curso;
    address private _docente;
    mapping(string => uint8) private _notas_materia;

    constructor(string memory nombre_, string memory apellido_, string memory curso_)
    {
        _nombre = nombre_;
        _apellido = apellido_;
        _curso = curso_;

        _docente = msg.sender;
    }

    function get_apellido() public view returns(string memory)
    {
        return _apellido;
    }

    // function get_nombre_completo() public view returns (string memory)
    // {
    //     return (_nombre + " " + _apellido);
    // }

    function get_curso() public view returns(string memory)
    {
        return _curso;
    }

    function set_nota_materia(uint8 nota_, string memory materia_) public
    {
        require(msg.sender == _docente, "Solo el docente registrado puede asignar notas");
        _notas_materia[materia_] = nota_;
    }

    function get_nota_materia(string memory materia_) public view returns(uint8)
    {
        return _notas_materia[materia_];
    }

    function aprobo(string memory materia_) public view returns(bool)
    {
        if(_notas_materia[materia_] >= 60)
        {
            return false;
        }
        return true;
    }


    //NO Funca
    function promedio() public view returns(int)
    {
        uint8 private _promedio = 0;
        for(int i = 0; i < _notas_materias.length; i++)
        {
            _promedio += _notas_materia[i]
        }
    }
}