// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

contract Estudiante
{
    string private _nombre;
    string private _apellido;
    string private _curso;
    address private _docente;

    mapping(string => uint256) private _notas_materia;
    
    mapping(string => uint256)[4] private _bim_mat_notas;

    string[] private _materias;
    uint256[4] private _bimestres;

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

    function set_notamateria(uint256 nota_, string memory materia_, uint256 bim_) public
    {
        require(msg.sender == _docente, "Solo el docente registrado puede asignar notas");
        //_notas_materia[materia_] = nota_;

        _bim_mat_notas[bim_][materia_] = nota_;
        
        _bimestres[bim_] = _materias[materia_];
    }

    function get_notamateria(string memory materia_, uint256 bim_) public view returns(uint256)
    {
        return _bim_mat_notas[bim_][materia_];
    }

    function aprobo(string memory materia_, uint256 bim_) public view returns(bool)
    {
        if(_bim_mat_notas[bim_][materia_] >= 60)
        {
            return true;
        }
        return false;
    }

    function promedio(uint256 bimestre_) public view returns(uint256)
    {
        uint256 _promedio = 0;

        for(uint256 i = 0; i < 4; i++)
        {
            for(uint256 i = 0; i < _materias.length; i++)
            {
                _promedio += _bim_mat_notas[bimestre_][_materias[i]];
            }
        }
        

        _promedio /= _materias.length;
        return _promedio;
    }
}