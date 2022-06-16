// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

contract Estudiante
{
    string private _nombre;
    string private _apellido;
    string private _curso;
    address private _docente;

    mapping(string => uint256) private _notas_materia;
    string[] private _materias;

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

    function get_nombre_completo() public view returns (string memory)
    {
        return string.concat(_nombre," ", _apellido);
    }

    function get_curso() public view returns(string memory)
    {
        return _curso;
    }

    function set_notamateria(uint256 nota_, string memory materia_) public
    {
        require(msg.sender == _docente, "Solo el docente registrado puede asignar notas");
        
        if(_notas_materia[materia_] == 0)
        {
           _materias.push(materia_); 
        }
        
        _notas_materia[materia_] = nota_;
    }

    function get_notamateria(string memory materia_) public view returns(uint256)
    {
        return _notas_materia[materia_];
    }

    function aprobo(string memory materia_) public view returns(bool)
    {
        if(_notas_materia[materia_] >= 60)
        {
            return true;
        }
        return false;
    }

    function promedio() public view returns(uint256)
    {
        uint256 _promedio = 0;

        for(uint256 i = 0; i < _materias.length; i++)
        {
            _promedio += _notas_materia[_materias[i]];
        }

        _promedio /= _materias.length;
        return _promedio;
    }
}